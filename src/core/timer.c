/*
 * Astra Core
 * http://cesbo.com/astra
 *
 * Copyright (C) 2012-2015, Andrey Dyldin <and@cesbo.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <astra.h>

struct asc_timer_t
{
    timer_callback_t callback;
    void *arg;

    uint64_t interval;
    uint64_t next_shot;
};

static asc_list_t *timer_list;

void asc_timer_core_init(void)
{
    timer_list = asc_list_init();
}

void asc_timer_core_destroy(void)
{
    if (!timer_list)
        return;

    asc_list_first(timer_list);
    while(!asc_list_eol(timer_list))
    {
        free(asc_list_data(timer_list));
        asc_list_remove_current(timer_list);
    }

    ASC_FREE(timer_list, asc_list_destroy);
}

void asc_timer_core_loop(void)
{
    int is_detached = 0;

    asc_list_for(timer_list)
    {
        asc_timer_t *timer = (asc_timer_t *)asc_list_data(timer_list);
        if(!timer->callback)
        {
            ++is_detached;
            continue;
        }

        if(asc_utime() >= timer->next_shot)
        {
            if(timer->interval == 0)
            {
                // one shot timer
                asc_main_loop_busy();
                timer->callback(timer->arg);
                timer->callback = NULL;
                ++is_detached;
            }
            else
            {
                asc_main_loop_busy();
                timer->callback(timer->arg);
                timer->next_shot = asc_utime() + timer->interval;
            }
        }
    }

    if(!is_detached)
        return;

    asc_list_first(timer_list);
    while(!asc_list_eol(timer_list))
    {
        asc_timer_t *timer = (asc_timer_t *)asc_list_data(timer_list);
        if(timer->callback)
            asc_list_next(timer_list);
        else
        {
            free(asc_list_data(timer_list));
            asc_list_remove_current(timer_list);
        }
    }
}

asc_timer_t *asc_timer_init(unsigned int ms, timer_callback_t callback, void *arg)
{
    asc_timer_t *const timer = (asc_timer_t *)calloc(1, sizeof(asc_timer_t));
    timer->interval = ms * 1000;
    timer->callback = callback;
    timer->arg = arg;

    timer->next_shot = asc_utime() + timer->interval;

    asc_list_insert_tail(timer_list, timer);

    return timer;
}

asc_timer_t *asc_timer_one_shot(unsigned int ms, timer_callback_t callback, void *arg)
{
    asc_timer_t *const timer = asc_timer_init(ms, callback, arg);
    timer->interval = 0;

    return timer;
}

void asc_timer_destroy(asc_timer_t *timer)
{
    if(!timer)
        return;

    timer->callback = NULL;
}
