param([string]$Src, [int]$X = 5)
Add-Type -AssemblyName System.Drawing
$img = New-Object System.Drawing.Bitmap $Src
$prev = ""; $start = 0
for ($y = 0; $y -lt $img.Height; $y++) {
  $c = $img.GetPixel($X, $y)
  $hex = "#{0:x2}{1:x2}{2:x2}" -f $c.R, $c.G, $c.B
  if ($hex -ne $prev) {
    if ($prev -ne "" -and ($y - $start) -ge 8) { "{0,5}-{1,5} ({2,4}px) {3}" -f $start, ($y - 1), ($y - $start), $prev }
    $prev = $hex; $start = $y
  }
}
"{0,5}-{1,5} ({2,4}px) {3}" -f $start, ($img.Height - 1), ($img.Height - $start), $prev
"size {0}x{1}" -f $img.Width, $img.Height
$img.Dispose()
