main :: () {
    gpu_init();

    ptr := gpu_malloc(1024);
    _, gpu_ptr := gpu_malloc(1024, .GPU);

    memset(ptr, 255, 1024);

    gpu_free(ptr);
    gpu_free(gpu_ptr);

    main_queue := gpu_get_queue(.MAIN, 0);

    cmd_buff := gpu_start_command_recording(main_queue);

    gpu_submit(main_queue, cmd_buff);

    gpu_shutdown();
}

#import,file "../../simp_gpu/module.jai"(VALIDATION = true);
