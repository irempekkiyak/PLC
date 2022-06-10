begin
int: xx=5
int: yy
int: maxNumber
get <yy>
if xx<yy
(
    maxNumber=yy
    print maxNumber
)
else
(
    maxNumber=xx
    print maxNumber
)

if int: newValue=2 < int: newValue2=3
(
    char: irem
    get <irem>
    print irem
    newValue=newValue + 1
)

int: intVar=10
char: charVar
float: floatVar
for int: ctrl=0 , ctrl<intVar
(
    print ctrl
    ctrl=ctrl + 1
)
get <charVar>
print charVar



int: irem
irem=5
while irem<6
(
    print irem
)
float: value=9.0
int: value2=2/(value + irem)
value2= value2 * 2
print value2


end
