Feature: Water
    As a coffee lover
    I have to handle the water tank
    So I can have coffee when I need it

#                 _            _.,----,
#  __  _.-._ / '-.        -  ,._  \) 
# |  `-)_   '-.   \       / < _ )/" }
# /__    '-.   \   '-, ___(c-(6)=(6)
#  , `'.    `._ '.  _,'   >\    "  )
#  :;;,,'-._   '---' (  ( "/`. -='/
# ;:;;:;;,  '..__    ,`-.`)'- '--'
# ;';:;;;;;'-._ /'._|   Y/   _/' \
#       '''"._ F    |  _/ _.'._   `\
#              L    \   \/     '._  \
#       .-,-,_ |     `.  `'---,  \_ _|
#       //    'L    /  \,   ("--',=`)7
#      | `._       : _,  \  /'`-._L,_'-._
#      '--' '-.\__/ _L   .`'         './/
#                  [ (  /
#                   ) `{
#        snd        \__)

  Background:
    Given the coffee machine is started
    And I handle everything except the water tank

  Scenario: Message "Fill water tank" is displayed after 50 coffees are taken
    When I take "50" coffees
    Then message "Fill tank" should be displayed

  Scenario: It is possible to take 10 coffees after the message "Fill water tank" is displayed
    Given I take "60" coffees
    Then coffee should be served
    When I take a coffee
    Then coffee should not be served

  Scenario: When the water tank is filled, the message disappears
    Given I take "55" coffees
    When I fill the water tank
    Then message "Ready" should be displayed
