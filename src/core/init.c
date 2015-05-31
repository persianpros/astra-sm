/*
 * Astra Core (Initialization)
 * http://cesbo.com/astra
 *
 * Copyright (C) 2015, Artem Kharitonov <artem@sysert.ru>
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

void astra_core_init(void)
{
    asc_lua_core_init();
    asc_thread_core_init();
    asc_timer_core_init();
    asc_socket_core_init();
    asc_event_core_init();
}

void astra_core_destroy(void)
{
    asc_lua_core_destroy();
    asc_event_core_destroy();
    asc_socket_core_destroy();
    asc_timer_core_destroy();
    asc_thread_core_destroy();
    asc_log_core_destroy();
}
