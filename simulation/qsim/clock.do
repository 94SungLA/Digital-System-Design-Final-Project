onerror {quit -f}
vlib work
vlog -work work clock.vo
vlog -work work clock.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.alarm_clock_vlg_vec_tst
vcd file -direction clock.msim.vcd
vcd add -internal alarm_clock_vlg_vec_tst/*
vcd add -internal alarm_clock_vlg_vec_tst/i1/*
add wave /*
run -all
