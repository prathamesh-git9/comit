param(
  [Parameter(Mandatory=False)][string] =  2020-07-01,
  [Parameter(Mandatory=False)][string] = (Get-Date).ToString(yyyy-MM-dd),
  [Parameter(Mandatory=False)][int] = 10
)

 = [datetime]::ParseExact(, yyyy-MM-dd, )
 = [datetime]::ParseExact(, yyyy-MM-dd, )

if ( -gt ) { Write-Error Start date after end date.; exit 1 }

 = data.txt

for ( = ;  -le ;  = .AddDays(1)) {
   = Get-Random -Minimum 1 -Maximum ( + 1)
  for ( = 1;  -le ; ++) {
     = Get-Random -Minimum 0 -Maximum 86400
     = .AddSeconds()
    Add-Content -Path  -Value (.ToString(o) +  commit  +  +   + [guid]::NewGuid().ToString())
     = .ToString( yyyy-MM-dd HH:mm:ss K)
     = 
    git add  | Out-Null
    git commit -m (auto:  + .ToString( yyyy-MM-dd) +  commit  + ) | Out-Null
  }
}
