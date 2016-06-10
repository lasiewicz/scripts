$subject="Wrap complete test "
$Body="files wrapped"
$ret= [char]13
function sendresults
    {

    $From = "William.Lasiewicz@bydeluxe.com"
$To = @("<Jim.Lichnerowicz@bydeluxe.com>" , "<Shalaleh.Shabnam@bydeluxe.com>","<William.Lasiewicz@bydeluxe.com>" , "<Stephen.Zupan@bydeluxe.com>", "<Abhay.Shekatkar@bydeluxe.com>")
$Cc = "William.Lasiewicz@bydeluxe.com"
$pwd = ConvertTo-SecureString ‘deluxemedia’ -AsPlainText -Force 
$cred = New-Object System.Management.Automation.PSCredential "DeluxeMediaWrap",$pwd
$param = @{ 
    SmtpServer = ‘smtp.gmail.com’ 
  #  Port = 587 
    UseSsl = $true 
    Credential = $cred 
    From = $From 
    To = $To
    Subject = $subject 
    Body = $Body
    } 

Send-MailMessage @param

    }



function DRMWrap
{
                
         $BegDate=Date -date $StartDate  
                $SYear=[string] $BegDate.Year
                $SMonth=[string] $BegDate.Month 
                $IMonth=[int] $SMonth
                if ($IMonth -lt 10)
                {
                    $SMonth="0" + $SMonth
                }
                $SDay=[string] $BegDate.Day
                $IDay=[int] $SDay
                if ($IDay -lt 10)
                {
                    $SDay="0" + $sDay
                }
                $EndDate=Date -date $StartDate  
                $EndDate=  ($EndDate).AddDays($Ndays)
                $EYear=[string] $EndDate.Year
                $EMonth=[string] $EndDate.Month 
                $EIMonth=[int] $EMonth
                $EDay=[string] $EndDate.Day
                $IEDay=[int] $EDay
                if ($EIMonth -lt 10)
                {
                    $EMonth="0" + $EMonth
                }
                if ($IEDay -lt 10)
                {
                    $EDay="0" + $EDay
                }
                $StrDate=$EYear + $EMonth  + $EDay
                $numoffiles=0
                $newestfile
                $timenewestfile
                $foldname=$Sname + "\" + $folder.name
                $Parm1=$SYear +"-"+ $SMonth  + "-" + $SDay
                $Parm2=$EYear +"-"+ $EMonth  + "-" + $EDay


                ForEach ($file in Get-ChildItem $foldname )   #  For all the files in the folder name
                {                    
                    $filemode="d----"
                    $fmode=$file.mode
                    if ($fmode.CompareTo($filemode))
                    {
                       $content = $file.BaseName
                       $filedate=$file.LastWriteTime
					   $fullpath=$foldname  + $content  + ".mp4"
                       $Newpath=$foldname + $content + "_ex" + $StrDate + ".mp4"
                       #Rename-Item $fullpath $Newpath
                 }     
                        
                } # end for each file         

                
                #Copy-Item $Sname\* $infolder
                ForEach ($file in Get-ChildItem $infolder )   #  For all the files in the folder name
                {                    
                       $content = $file.BaseName
                        $Body=$Body + $ret + $content
                 
			          # cmd.exe /c $batch
                       
                 }     # end for each file      
                
                $subject="Wrap complete "
                   sendresults

               


   }  # end of function 

$Type=$args[0]
$Disney=$args[1]
$StartDate=$args[2]
$FinalFolder=$args[3]
$Airline=$args[4]


$Sname="C:\MediaShuttle"
$infolder="d:\KeyOSEncryptionServer\ServerTester\test\in"
$outfolder="d:\KeyOSEncryptionServer\ServerTester\test\out"


$StartDate=$StartDate + " 8:30 AM"
$Airline="WestJet"
$Disney="Yes"
$StartDate="6/1/2016"
$FinalFolder="2016_Jun_AS"

if ($Airline-eq "WestJet")
{
    if ($Disney-eq "Yes")
    {
        $Ndays=120
    }
    if ($Disney-eq "No")
    {
        $Ndays=150
    }

}

if ($Airline-eq "Alaska")
{
    if ($Disney-eq "Yes")
    {
        $Ndays=90
    }
    if ($Disney-eq "No")
    {
        $Ndays=140
    }

}
 


Write-Host ("FinalFolder " + $FinalFolder)
Write-Host ("Disney " + $Disney)
Write-Host ("StartDate " + $StartDate)
Write-Host ("Type " + $Type)
Write-Host ("Airline " + $Airline)
sendresults

