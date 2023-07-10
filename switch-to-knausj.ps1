Move-Item -Path talon-config-jme -Destination ..
if (Test-Path -Path ..\knausj_talon) {
    Move-Item -Path ..\knausj_talon -Destination .
} else {
    git clone https://github.com/knausj85/knausj_talon.git
}
