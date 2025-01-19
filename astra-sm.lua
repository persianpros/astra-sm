#!/usr/bin/astra

-- Config script example to stream ZeonBud T2-MI services from Eutelsat 9B (9.0E)
-- For other providers or services change settings with yours.
-- To use this config add channels in bouquet in the following format:
-- #SERVICE 1:0:1:B:0:0:0:0:0:0:http%3a//0.0.0.0%3a9999/zombi/11:Inter
-- #DESCRIPTION Інтер
-- #SERVICE 1:0:1:C:0:0:0:0:0:0:http%3a//0.0.0.0%3a9999/zombi/12:Ukraina
-- #DESCRIPTION Україна
-- etc...
--
-- Аdd in /etc/enigma2/lamedb
-- 005a0000:006e:2324
-- 	s 12226000:30000000:1:4:90:2:0:1:2:3:2:10:1:0
-- /
-- 005a0000:00d2:2324
-- 	s 12226000:30000000:1:4:90:2:0:1:2:3:2:20:1:0
-- /
-- 005a0000:0136:2324
-- 	s 12303000:30000000:1:4:90:2:0:1:2:3:2:30:1:0
-- 
-- 006e:005a0000:006e:2324:1:0:0
-- ZeonBud-MX1 T2-MI
-- p:ZeonBud,c:030fff,c:151000,f:1
-- 00d2:005a0000:00d2:2324:1:0:0
-- ZeonBud-MX2 T2-MI
-- p:ZeonBud,c:030fff,c:151000,f:1
-- 0136:005a0000:0136:2324:1:0:0
-- ZeonBud-MX3 T2-MI
-- p:ZeonBud,c:030fff,c:151000,f:1

log.set({ filename = "/var/log/astra.log", stdout = false, debug = false, color = true, syslog = "astra", })

f12226isi10 = make_t2mi_decap({
        name = "12226V ISI10 T2-MI PLP0",
        input = "http://127.0.0.1:8001/1:0:64:6E:6E:2324:5A0000:0:0:0:",
        plp = 0,
        pnr = 0,
        pid = 4096,
})

make_channel({
        name = "ZeonBud-MX1", input = { "t2mi://f12226isi10", },
        output = { "http://0.0.0.0:9999/zeonbud/mx1", },
})

f12226isi20 = make_t2mi_decap({
        name = "12226V ISI20 T2-MI PLP0",
        input = "http://127.0.0.1:8001/1:0:64:D2:D2:2324:5A0000:0:0:0:",
        plp = 0,
        pnr = 0,
        pid = 4096,
})

make_channel({
        name = "ZeonBud-MX2", input = { "t2mi://f12226isi20", },
        output = { "http://0.0.0.0:9999/zeonbud/mx2", },
})

f12303isi30 = make_t2mi_decap({
        name = "12303V ISI30 T2-MI PLP0",
        input = "http://127.0.0.1:8001/1:0:64:136:136:2324:5A0000:0:0:0:",
        plp = 0,
        pnr = 0,
        pid = 4096,
})

make_channel({
        name = "ZeonBud-MX3", input = { "t2mi://f12303isi30", },
        output = { "http://0.0.0.0:9999/zeonbud/mx3", },
})

make_channel({
    name = "Перший",
    input = {
        "t2mi://f12226isi10#pnr=11"
    },
    output = {
        "http://0.0.0.0:9999/zombi/11"
    }
})

make_channel({
    name = "1+1 Україна",
    input = {
        "t2mi://f12226isi10#pnr=12"
    },
    output = {
        "http://0.0.0.0:9999/zombi/12"
    }
})

make_channel({
    name = "1+1 МАРАФОН",
    input = {
        "t2mi://f12226isi10#pnr=13"
    },
    output = {
        "http://0.0.0.0:9999/zombi/13"
    }
})

make_channel({
    name = "Суспільне Культура",
    input = {
        "t2mi://f12226isi10#pnr=14"
    },
    output = {
        "http://0.0.0.0:9999/zombi/14"
    }
})

make_channel({
    name = "ICTV",
    input = {
        "t2mi://f12226isi10#pnr=15"
    },
    output = {
        "http://0.0.0.0:9999/zombi/15"
    }
})

make_channel({
    name = "СТБ",
    input = {
        "t2mi://f12226isi10#pnr=16"
    },
    output = {
        "http://0.0.0.0:9999/zombi/16"
    }
})

make_channel({
    name = "Інтер",
    input = {
        "t2mi://f12226isi10#pnr=17"
    },
    output = {
        "http://0.0.0.0:9999/zombi/17"
    }
})

make_channel({
    name = "УНІАН",
    input = {
        "t2mi://f12226isi10#pnr=18"
    },
    output = {
        "http://0.0.0.0:9999/zombi/18"
    }
})

make_channel({
    name = "БІГУДІ",
    input = {
        "t2mi://f12226isi10#pnr=19"
    },
    output = {
        "http://0.0.0.0:9999/zombi/19"
    }
})

make_channel({
    name = "super+",
    input = {
        "t2mi://f12226isi10#pnr=20"
    },
    output = {
        "http://0.0.0.0:9999/zombi/20"
    }
})

make_channel({
    name = "Новий канал",
    input = {
        "t2mi://f12226isi20#pnr=21"
    },
    output = {
        "http://0.0.0.0:9999/zombi/21"
    }
})

make_channel({
    name = "TET",
    input = {
        "t2mi://f12226isi20#pnr=22"
    },
    output = {
        "http://0.0.0.0:9999/zombi/22"
    }
})

make_channel({
    name = "2+2",
    input = {
        "t2mi://f12226isi20#pnr=23"
    },
    output = {
        "http://0.0.0.0:9999/zombi/23"
    }
})

make_channel({
    name = "M-1",
    input = {
        "t2mi://f12226isi20#pnr=24"
    },
    output = {
        "http://0.0.0.0:9999/zombi/24"
    }
})

make_channel({
    name = "НТН",
    input = {
        "t2mi://f12226isi20#pnr=25"
    },
    output = {
        "http://0.0.0.0:9999/zombi/25"
    }
})

make_channel({
    name = "Мега",
    input = {
        "t2mi://f12226isi20#pnr=26"
    },
    output = {
        "http://0.0.0.0:9999/zombi/26"
    }
})

make_channel({
    name = "ПЛЮСПЛЮС",
    input = {
        "t2mi://f12226isi20#pnr=27"
    },
    output = {
        "http://0.0.0.0:9999/zombi/27"
    }
})

make_channel({
    name = "МИ-УKРАЇНА+",
    input = {
        "t2mi://f12226isi20#pnr=28"
    },
    output = {
        "http://0.0.0.0:9999/zombi/28"
    }
})

make_channel({
    name = "Test MX2-9",
    input = {
        "t2mi://f12226isi20#pnr=29"
    },
    output = {
        "http://0.0.0.0:9999/zombi/29"
    }
})

make_channel({
    name = "ICTV2",
    input = {
        "t2mi://f12226isi20#pnr=30"
    },
    output = {
        "http://0.0.0.0:9999/zombi/30"
    }
})

make_channel({
    name = "ОЦЕ",
    input = {
        "t2mi://f12226isi20#pnr=52"
    },
    output = {
        "http://0.0.0.0:9999/zombi/52"
    }
})

make_channel({
    name = "K-1",
    input = {
        "t2mi://f12303isi30#pnr=31"
    },
    output = {
        "http://0.0.0.0:9999/zombi/31"
    }
})

make_channel({
    name = "K-2",
    input = {
        "t2mi://f12303isi30#pnr=32"
    },
    output = {
        "http://0.0.0.0:9999/zombi/32"
    }
})

make_channel({
    name = "ZOOM",
    input = {
        "t2mi://f12303isi30#pnr=33"
    },
    output = {
        "http://0.0.0.0:9999/zombi/33"
    }
})

make_channel({
    name = "ПРЯМИЙ",
    input = {
        "t2mi://f12303isi30#pnr=34"
    },
    output = {
        "http://0.0.0.0:9999/zombi/34"
    }
})

make_channel({
    name = "ЕСПРЕСО TV",
    input = {
        "t2mi://f12303isi30#pnr=35"
    },
    output = {
        "http://0.0.0.0:9999/zombi/35"
    }
})

make_channel({
    name = "XSPORT",
    input = {
        "t2mi://f12303isi30#pnr=36"
    },
    output = {
        "http://0.0.0.0:9999/zombi/36"
    }
})

make_channel({
    name = "Enter-фільм",
    input = {
        "t2mi://f12303isi30#pnr=37"
    },
    output = {
        "http://0.0.0.0:9999/zombi/37"
    }
})

make_channel({
    name = "Pixel",
    input = {
        "t2mi://f12303isi30#pnr=38"
    },
    output = {
        "http://0.0.0.0:9999/zombi/38"
    }
})

make_channel({
    name = "SONCE",
    input = {
        "t2mi://f12303isi30#pnr=39"
    },
    output = {
        "http://0.0.0.0:9999/zombi/39"
    }
})
