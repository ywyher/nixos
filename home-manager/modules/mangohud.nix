{ ... }: {
  programs.mangohud = {
    enable = true;

    settings = {
      fps = true;                    # Show FPS
      gpu_stats = true;              # Show GPU usage
      cpu_stats = true;              # Show CPU usage
      cpu_temp = true;               # Show CPU temperature
      gpu_temp = true;               # Show GPU temperature
      ram = true;                    # Show RAM usage
      io_stats = true;               # Show disk I/O
      fps_limit = 0;                 # No FPS limit
      background_alpha = 0.5;        # Semi-transparent background
      position = "top-right";        # Position on the screen
    };
  };
}