# Video Crop Automation Script

This batch script automates the process of detecting and applying crop values to a video file using FFmpeg. You can use this script either by dragging and dropping a video file onto it or by manually inputting the file path when prompted.

## Prerequisites

- **FFmpeg**: Ensure FFmpeg is installed on your system and is available in your system's PATH. You can download FFmpeg from [FFmpeg.org](https://ffmpeg.org/download.html).

## Usage

### Drag and Drop Method

1. **Drag and Drop**: Simply drag and drop a video file onto the `auto_crop.bat` script.
2. The script will automatically process the video, detect the optimal crop values, and create a cropped version of the video in the same directory.

### Manual Input Method

1. **Double-click** the `auto_crop.bat` script.
2. When prompted, enter the full path to the video file you want to process.
3. The script will process the video, detect the optimal crop values, and create a cropped version of the video in the same directory.

### Example

```
Enter the full path of the video file: C:\path\to\your\video.mp4
```

### Output

The cropped video will be saved in the same directory as the original file with `_cropped` appended to the filename. For example, if your original file is `video.mp4`, the output file will be `video_cropped.mp4`.

## How It Works

1. **Crop Detection**: The script uses FFmpeg's `cropdetect` filter to analyze the video and determine the optimal crop values.
2. **Crop Application**: Once the crop values are detected, they are applied to the video, and a new cropped video file is generated.

## Error Handling

- If the script cannot detect crop values, it will display an error message and exit.
- If FFmpeg fails to crop the video, an error message will be displayed.

## Requirements

- **Operating System**: Windows
- **FFmpeg**: Ensure FFmpeg is installed and properly configured in your system's PATH.

## Troubleshooting

- If the script does not run, make sure FFmpeg is correctly installed and accessible from the command line.
- Ensure that the video file exists and the path is correctly specified.

## License

This script is provided "as is", without warranty of any kind.

