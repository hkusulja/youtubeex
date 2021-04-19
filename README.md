# youtubeex

youtubeex is a free and open source project based on PowerShell script for downloading audio as mp3 files from youtube, supporting also youtube channels.

## Requirments

* Windows 10 with PowerShell 7
* Use of Youtube-dl.exe from https://github.com/ytdl-org
* Use of FFmpeg from https://www.ffmpeg.org/

## Usage

.\youtubeex

## Examples

.\youtubeex -Url https://www.youtube.com/watch?v=EFCdGPQYjEs

.\youtubeex -Url https://www.youtube.com/watch?v=EFCdGPQYjEs -Verbose

.\youtubeex -Url https://www.youtube.com/watch?v=EFCdGPQYjEs -Simulate -Verbose

.\youtubeex -Url https://www.youtube.com/channel/UCPKT_csvP72boVX0XrMtagQ/videos  -PlaylistSubdirectory -Verbose
