param([string]$Ref, [string]$Out, [string]$Prefix, [int]$Step = 900)
# Side-by-side bands: reference (left) | render (right), plus band list with mean abs diff
Add-Type -AssemblyName System.Drawing
$a = New-Object System.Drawing.Bitmap $Ref
$b = New-Object System.Drawing.Bitmap $Out
"ref {0}x{1}  render {2}x{3}" -f $a.Width, $a.Height, $b.Width, $b.Height
$w = $a.Width; $h = [Math]::Min($a.Height, $b.Height)
$i = 0
for ($y = 0; $y -lt $h; $y += $Step) {
  $ch = [Math]::Min($Step, $h - $y)
  $bmp = New-Object System.Drawing.Bitmap ($w * 2 + 10), $ch
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.Clear([System.Drawing.Color]::Red)
  $src = New-Object System.Drawing.Rectangle 0, $y, $w, $ch
  $g.DrawImage($a, (New-Object System.Drawing.Rectangle 0, 0, $w, $ch), $src, [System.Drawing.GraphicsUnit]::Pixel)
  $g.DrawImage($b, (New-Object System.Drawing.Rectangle ($w + 10), 0, $w, $ch), $src, [System.Drawing.GraphicsUnit]::Pixel)
  $bmp.Save(("{0}_{1:D2}.png" -f $Prefix, $i), [System.Drawing.Imaging.ImageFormat]::Png)
  # sampled mean abs difference
  $sum = 0; $n = 0
  for ($yy = $y; $yy -lt $y + $ch; $yy += 4) { for ($xx = 0; $xx -lt $w; $xx += 4) {
    $p = $a.GetPixel($xx, $yy); $q = $b.GetPixel($xx, $yy)
    $sum += [Math]::Abs($p.R - $q.R) + [Math]::Abs($p.G - $q.G) + [Math]::Abs($p.B - $q.B); $n++ } }
  "band {0} (y {1}-{2}): similarity {3:N2}%" -f $i, $y, ($y + $ch), (100 - 100 * $sum / ($n * 765))
  $g.Dispose(); $bmp.Dispose(); $i++
}
$a.Dispose(); $b.Dispose()
