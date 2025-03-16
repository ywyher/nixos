{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      nvidia-offload = "env __NV_PRIME_RENDER_OFFLOAD=1 __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only";
    };
  };
}