transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ukprom.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ukp.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/rtc.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/pc.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/crtc.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/clockgen.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/fz80 {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/fz80/fz80.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ip {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ip/ARAMB4_S8_S8.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ip {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/ip/ARAMB4_S4_S8.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/altip {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/altip/altip_inside_rom.v}
vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/altip {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/altip/altip_inside_ram_32KB.v}

vlog -vlog01compat -work work +incdir+D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl {D:/home/inouema/work/PC-8001/development/pc-8001on1chipmsx/rtl/pc-testvench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone_ver -L rtl_work -L work -voptargs="+acc" pc8001tv

add wave *
view structure
view signals
run -all
