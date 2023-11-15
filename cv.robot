*** Settings ***

Library    OperatingSystem
Library    String
Library    SeleniumLibrary

*** Variables ***
${name}    TIINA YLIMÄKI

*** Test Cases ***
Is it really a CV?
## Avataan selain.
    Open Browser    https://tiibuturner.github.io/CurriculumVitae/curriculumvitae.html
    Sleep    2
    Maximize Browser Window
    Sleep    2
## Tarkistetaan, että sivulta löytyy variaabeleihin luotu nimi.
    Page Should Contain    ${name}

    Sleep    2
## Scrollataan alaspäin.
    Execute Javascript    window.scrollTo(500,900)

## Tarkistetaan, että sivulta löytyy linkki.
    Page Should Contain Link    xpath:/html/body/div[2]/div/div[1]/div/li[4]/a
    Sleep    1
## Tarkistetaan, että linkki toimii ja, että sieltä löytyy variaabeleihin luotu nimi.
    Click Link    xpath:/html/body/div[2]/div/div[1]/div/li[4]/a
    Page Should Contain    ${name}
    Close Window

## Suljetaan selain.
    Sleep    2
    Close Browser