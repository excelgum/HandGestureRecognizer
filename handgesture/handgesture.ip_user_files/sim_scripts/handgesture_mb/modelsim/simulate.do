onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L xlconcat_v2_1_1 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_16 -L fifo_generator_v13_2_2 -L axi_data_fifo_v2_1_15 -L axi_crossbar_v2_1_17 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.handgesture_mb xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {handgesture_mb.udo}

run -all

quit -force
