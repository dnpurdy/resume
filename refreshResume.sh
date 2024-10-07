#!/bin/bash
#set -x
set -e

# Refresh BUILD directory
./gradlew clean run

# Update S3
AWS_PROFILE=resume aws s3 cp ./build/resumeOutput/resume.html s3://resume.davidpurdy.net/resume.html
AWS_PROFILE=resume aws s3 cp ./build/resumeOutput/DavidPurdy-resume.fo s3://resume.davidpurdy.net/DavidPurdy-resume.fo
AWS_PROFILE=resume aws s3 cp ./build/resumeOutput/DavidPurdy-resume.pdf s3://resume.davidpurdy.net/DavidPurdy-resume.pdf
AWS_PROFILE=resume aws s3 cp ./build/resumeOutput/DavidPurdy-resume.rtf s3://resume.davidpurdy.net/DavidPurdy-resume.rtf
AWS_PROFILE=resume aws s3 cp ./build/resumeOutput/DavidPurdy-resume.txt s3://resume.davidpurdy.net/DavidPurdy-resume.txt