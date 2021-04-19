# yooutubeex
Param(
    [Parameter(Mandatory=$true, Position=0, HelpMessage='Enter YouTube URL (or more URLs seperated with coma.')]
    [String[]] $Url,

    [Parameter(Mandatory=$false, Position=1, HelpMessage='Enter Output Directory Path.')]
    [String] $OutputPath = 'C:\Users\hkusu\Desktop\Temp\',

    [Parameter(Mandatory=$false, HelpMessage='YouTube-dl.exe path.')]
    [String] $YoutubeDLPath = 'C:\Users\hkusu\OneDrive\Programs\youtube-dl.exe',

    [Parameter(Mandatory=$false, HelpMessage='FFmpeg directory path.')]
    [String] $FFmpegPath = 'C:\Users\hkusu\OneDrive\Programs\FFmpeg\',

    [Parameter(Mandatory=$false, HelpMessage='Youtube-DL simulation')]
    [switch] $Simulate,

    [Parameter(Mandatory=$false, HelpMessage='Set output path format to include playlist directory')]
    [switch] $PlaylistSubdirectory
)

# Prepare parameters

$parameters = ''
$parameters += ' --extract-audio  --audio-format mp3 --audio-quality 0'
$parameters += ' --ffmpeg-location ' + $FFmpegPath
$parameters += $Simulate.IsPresent ? ' -s' : ''
$parameters += " -o '" + $OutputPath + ($PlaylistSubdirectory.IsPresent ? '%(playlist)s\%(title)s.%(ext)s' : '%(title)s.%(ext)s') + "'"

# Output filename format

# foreach input URL execute youtube-dl
foreach ($UrlItem in $Url) {
    $cmd = $YoutubeDLPath + $parameters + ' ' + $UrlItem

    Write-Verbose $cmd   
    Invoke-Expression $cmd
}

Write-Host -ForegroundColor Green 'Done.'
