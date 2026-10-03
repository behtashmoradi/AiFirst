param([string]$Src, [string]$Out, [int]$X, [int]$Y, [int]$W, [int]$H, [string]$Fmt = "png")
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile($Src)
$bmp = New-Object System.Drawing.Bitmap $W, $H
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.DrawImage($img, (New-Object System.Drawing.Rectangle 0, 0, $W, $H), (New-Object System.Drawing.Rectangle $X, $Y, $W, $H), [System.Drawing.GraphicsUnit]::Pixel)
$f = if ($Fmt -eq "jpg") { [System.Drawing.Imaging.ImageFormat]::Jpeg } else { [System.Drawing.Imaging.ImageFormat]::Png }
$bmp.Save($Out, $f)
$g.Dispose(); $bmp.Dispose(); $img.Dispose()
"saved $Out"
