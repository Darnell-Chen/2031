onerror {exit -code 1}
vlib work
vcom -work work Lab_5_State_Machine.vho
vcom -work work lab_5_waveform.vwf.vht
vsim -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Lab_5_State_Machine_vhd_vec_tst
vcd file -direction Lab_5_State_Machine.msim.vcd
vcd add -internal Lab_5_State_Machine_vhd_vec_tst/*
vcd add -internal Lab_5_State_Machine_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
