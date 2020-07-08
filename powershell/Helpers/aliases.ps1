Import-Module "$home\code\github\dotfiles\powershell\Helpers\Utils.ps1"

function gf { git fetch --prune $args }
function gco { git checkout $args }
function gcob { git checkout -b $args }
function gcod { git checkout development $args }
function gcom { git checkout master $args }
function gs { git status -sb $args }
function gaa { git add --all $args }
function gl { git log $args }
function glo { git log --oneline $args }

function gpo {
  $CurrentBranch = Get-Git-CurrentBranch
  git push --set-upstream origin $CurrentBranch
}
function gp {
  $CurrentBranch = Get-Git-CurrentBranch
  git pull origin $CurrentBranch
}

function gw {
  $ticket = Get-Current-Ticket
  if ($null -eq $ticket) {
    git commit -m $args
  }
  else {
    git commit -m "(#$ticket) $args"
  }
}

function dswitch { git checkout "feature/koenv/$args" }
function gmdev { git pull origin development }
function gwmerge { git commit --file .\.git\MERGE_MSG }

function myproject {
  git config user.name "Koen Verburg"
  git config user.email "creativekoen@gmail.com"
}

function cpanel {
  $wtProfile = "Powershell"
  wt -p $wtProfile -d $args `; split-pane -V -p $wtProfile -d $args `; split-pane -H -p $wtProfile -d $args
}

# folder jumping
function dot {
  Set-Location "~/code/github/dotfiles"
}

# yarn aliases
function ys { yarn serve }
function yt { yarn test }
function yd { yarn dist }
function y { yarn }
