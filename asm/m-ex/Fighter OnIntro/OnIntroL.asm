#To be inserted @ 800bf0ec
.include "../../Globals.s"
.include "../Header.s"

.set  REG_PlayerGObj,29
.set  REG_PlayerData,31

#Check for an onIntroL function
  lwz r0,OFST_FighterOnIntroL(rtoc)
  lwz r4,0x4(REG_PlayerData)
  mulli r4,r4,4
  lwzx  r12,r4,r0
  cmpwi r12,0
  beq Exit
#Branch to function
  mr  r3,REG_PlayerGObj
  mtctr r12
  bctrl

Exit:
  lwz r0,0x002C(r1)
