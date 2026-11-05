# Check Files and Folders

    # Check folder 'PS-DLP' in 'MyVideos' user
    if (-not (Test-Path -Path $MyVideos)) {
        New-Item -Path $MyVideos -ItemType Directory | Out-Null
    }

    if (-not (Test-Path -Path "Downloads")) {
        New-Item -Path "Downloads" -ItemType Directory | Out-Null
    }