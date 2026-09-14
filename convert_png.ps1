Add-Type -AssemblyName System.Drawing

function Convert-ImageToPng {
    param(
        [string]$SourcePath,
        [string]$DestPath,
        [int]$Width,
        [int]$Height
    )
    $srcImg = [System.Drawing.Image]::FromFile($SourcePath)
    $destBmp = New-Object System.Drawing.Bitmap($Width, $Height)
    $graphics = [System.Drawing.Graphics]::FromImage($destBmp)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.DrawImage($srcImg, 0, 0, $Width, $Height)
    
    # Save as PNG
    $destBmp.Save($DestPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $graphics.Dispose()
    $destBmp.Dispose()
    $srcImg.Dispose()
}

$iconSrc = "C:\Users\SOHAM PRAJAPATI\.gemini\antigravity-ide\brain\511daedb-12db-47eb-a5c8-2ad0a42f6c4c\hotel_dwarkesh_icon_1789408639372.jpg"
$bannerSrc = "C:\Users\SOHAM PRAJAPATI\.gemini\antigravity-ide\brain\511daedb-12db-47eb-a5c8-2ad0a42f6c4c\hotel_dwarkesh_banner_1789408685555.jpg"

Convert-ImageToPng -SourcePath $iconSrc -DestPath "d:\hotel dwarkesh web\icons\icon-512.png" -Width 512 -Height 512
Convert-ImageToPng -SourcePath $iconSrc -DestPath "d:\hotel dwarkesh web\icons\icon-192.png" -Width 192 -Height 192
Convert-ImageToPng -SourcePath $bannerSrc -DestPath "d:\hotel dwarkesh web\icons\feature-graphic.png" -Width 1024 -Height 500

Write-Host "Real PNG files created successfully!"
