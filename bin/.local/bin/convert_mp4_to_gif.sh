# ~/dotfiles/bin/.local/bin/convert_mp4_to_gif.sh 15 Apr at 11:47:04 AM
# ~/dotfiles/arch-linux-x86-64/convert_mp4_to_gif.sh 22 Feb at 04:49:54 AM
ffmpeg -i output.mp4 -vf "fps=10,scale=720:-1:flags=lanczos" capture.gif
