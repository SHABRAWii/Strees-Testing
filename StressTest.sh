clear
{
    AC_CODE="JAVA" ## { 'C++' or 'JAVA' or 'PYTHON' }
    WA_CODE="JAVA" ## { 'C++' or 'JAVA' or 'PYTHON' }
    LANG=$WA_CODE
    [ "$LANG" = "JAVA" ] && LANG="Java"
    [ "$LANG" = "PYTHON" ] && LANG="Python"
    [ "$AC_CODE" = "C++" ] && AC_CODE="Build_Obj/AC.C++"
    [ "$AC_CODE" = "PYTHON" ] && AC_CODE="Coding_AC/dist/AC_Solution"
    [ "$AC_CODE" = "JAVA" ] && AC_CODE="Coding_AC/AC_Solution.class"
    [ "$WA_CODE" = "C++" ] && WA_CODE="Build_Obj/WA.C++"
    [ "$WA_CODE" = "PYTHON" ] && WA_CODE="Coding_WA/dist/WA_Solution"
    [ "$WA_CODE" = "JAVA" ] && WA_CODE="Coding_WA/WA_Solution.class"
    TimeLimit=1000
    # Colors
    {
        RED="\e[1;31m"
        RED_High="\033[1;91m"
        Green="\e[1;32m"
        Green_High="\033[1;92m"
        CYAN="\e[1;36m"
        CYAN_High="\033[1;96m"
        YELLOW="\e[1;33m"
        PURPLE="\e[1;35m"
        WHITE="\e[1;37m"
        NONE="\e[1;0m"
    }
    Borders="\033[1;93m"
    Title=$CYAN
    ID="\e[1;37m"
    TestCase="\e[1;37m"
    declare OVERFLOW=1
}
function Setup (){
    echo -e "$Borders==========================================================================================================="
    echo -e "$Borders=                            ${Title}Stress Test ${Green}|| ${Title}Time Limit ${CYAN}= ${RED}1.0 Seconds ${CYAN} Running...$Borders                          ="
    echo -e "$Borders==========================================================================================================="
    echo -e "$Borders= ${CYAN}   ID    $Borders|${CYAN}     Test Case     $Borders|${CYAN}    Lang    $Borders|${CYAN}         Verdict      $Borders   |${CYAN}       Time      $Borders |${CYAN}     Memory   $Borders  =\e[1;0m"
}    
function Out(){
    echo -e -n "$Borders="
    {
        for (( i=0 ; i < $(( (10-${#1})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m${ID}$1\e[1;0m$Borders"
        for (( i=0 ; i < $(( (10-${#1}+1)/2 )) ; i++ )); do echo -n  " "; done
        echo -n -e "|"
    }
    {
        for (( i=0 ; i < $(( (19-${#2})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m${TestCase}$2\e[1;0m$Borders"
        [ "$2" == "Generator 1✔️" ] && echo -e -n " "
        for (( i=0 ; i < $(( (19-${#2}+1)/2 )) ; i++ )); do echo -n  " "; done
        echo -n -e "|"
    }
    {
        for (( i=0 ; i < $(( (12-${#3})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m"
            [ $3 == "C++" ] && 
                { echo -e -n "${CYAN}";true; } ||
        {
            [ $3 == "Java" ] &&
                { echo -e -n "\e[1;35m";true; } ||
        {
            [ $3 == "Python" ] &&
                { echo -e -n "$RED";true; } 
        } }
        echo -e -n "$3\e[1;0m$Borders"
        for (( i=0 ; i < $(( (12-${#3}+1)/2 )) ; i++ )); do echo -n  " "; done
        echo -n -e "|"
    }
    {
        for (( i=0 ; i < $(( (25-${#4})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m"
            [ "$4" = "Accepted" ]     && { echo -e -n "${Green_High}"; true; } ||
        {
            [ "$4" = "Wrong Answer" ] && { echo -e -n "${RED_High}"; true; } ||
                { echo -e -n "\e[1;4m${RED_High}"; }
        } 
        echo -e -n "$4\e[1;0m$Borders"
        for (( i=0 ; i < $(( (25-${#4}+1)/2 )) ; i++ )); do echo -n  " "; done
        echo -n -e "|"
    }
    {
        for (( i=0 ; i < $(( (15-${#5})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m"
            [ "$5" -gt "$TimeLimit" ] && { echo -e -n "${RED_High}";true; } ||
                { echo -e -n "${Green_High}"; }
        echo -e -n "$5 ms\e[1;0m$Borders"
        for (( i=0 ; i < $(( (15-${#5}+1)/2 )) ; i++ )); do echo -n  " "; done
        echo -n -e "|"
    }
    {
        for (( i=0 ; i < $(( (16-${#6})/2 )) ; i++ )); do echo -n  " "; done
        echo -e -n "\e[1;3m"
            # [ "$6" -gt 262144 ] && { echo -e -n "${RED_High}";true; } ||
            #     { echo -e -n "${Green_High}"; }
        echo -e -n "${RED}$6\e[1;0m$Borders"
        for (( i=0 ; i < $(( (16-${#6}+1)/2 )) ; i++ )); do echo -n  " "; done
    }
    echo -n -e "${BORDER}="
}
declare -i _TIME=0
err=""
function TIME(){
    calc=$(( ($TimeLimit + 500) ))e-3
    calc=$(printf "%f\n" $calc)
    TimeStart=$(date +%s%N) ; 
    err=$(eval timeout "$calc"s $1 2>&1 )
    _TIME=$((($(date +%s%N) - $TimeStart)/1000000));    
}          
# Out 1 "Generator 1" "C++" "Accepted" 500 10;echo;Out 2 "Generator 1" "C++" "Wrong Answer" 1001 2;echo;Out 3 "Generator 1" "Java" "Crash" 99 3000;echo
declare -i loop=1
Verdict=Accepted
catch_exits() {
        echo -e -n "\r\033[K"
        [ "${#err}" -gt 0 ] && { Out $loop "Generator 1" $LANG "$Verdict" $_TIME 0;true; } ||
            { Out $loop Terminated $LANG Terminated 0 0; }
        echo -e -n "\n$Borders===========================================================================================================\n"
        [ "${#err}" -gt 0 ] && { echo -e "$CYAN ||";echo -e -n "$CYAN   ==> ";true; }
        for (( i = 0 ; i < ${#err} ; i++ ))
        do
            [ "${err:$i:1}" = ":" ] && { echo -e -n $YELLOW;true; } ||
        {
            [ "$i" == 0 ] && { echo -e -n $PURPLE;true; } ||
        {
            [ "${err:$i:13}" == 'runtime error' ] && { echo -e -n "\e[1;3m\e[1;4m"$RED_High;true; } ||
        {
            [ "${err:$i:5}" == 'index' ] && { echo -e -n $WHITE;true; }
        } } }
            echo -n "${err:$i:1}"
            [ "$i" == 0 ] && { echo -e -n $PURPLE;true; } ||
        {
            [ "${err:$i:1}" == ':' ] && { echo -e -n $WHITE;true; } ||
        {
            [ "${err:$(($i - 12)):13}" == 'runtime error' ] && { echo -e -n "\e[1;0m "$CYAN;true; }
        } }
            if [ "$Verdict" = "AC Code Runtime error" ] && [ "${err:$i:1}" == $'\n' ] && [ "$AC_CODE" = "Build_Obj/AC.C++" ]
                then 
                    break;
            fi
            if [ "$Verdict" = "Runtime error" ] && [ "${err:$i:1}" == $'\n' ] && [ "$WA_CODE" = "Build_Obj/WA.C++" ]
                then 
                    break;
            fi
        done
        echo 
        echo -e -n "\e[1;0m"
        exit 1
}
trap catch_exits 1 2 3 15 20 2> /dev/null
echo -e "${CYAN}Compiling Files...${RED}"
TS=$(date +%s%N) ; 
make AC_CODE=$AC_CODE WA_CODE=$WA_CODE
err=$(make AC_CODE=$AC_CODE WA_CODE=$WA_CODE 2>&1 )
if [ "${#err}" -gt 0 ]
    then
        echo -e  "      ${CYAN}###################################"
        if [ $AC_CODE != "Build_Obj/AC.C++" ] && [ $AC_CODE != "Coding_AC/AC_Solution.class" ] && [ $AC_CODE != "PYTHON" ] && [ $WA_CODE != "Build_Obj/AC.C++" ] && [ $WA_CODE != "Coding_WA/WA_Solution.class" ] && [ $WA_CODE != "PYTHON" ]
        then
            echo -e "      #   ${RED} Specified Langauge Wrong !${CYAN}   #"
        else
            echo -e "      #       ${RED} COMPILATION ERROR !${CYAN}      #"
        fi
        echo -e "      ###################################"
        echo -e -n $NONE
        exit
fi
_TT=$((($(date +%s%N) - $TS)/1000000));echo -e "${CYAN}Time taken to Compile is ${RED}$_TT ${CYAN}ms"
Setup   
while [ "$Verdict" == "Accepted" ]
do
    TIME "./Build_Obj/Generator"
    [ "$_TIME" -gt $TimeLimit ] && { 
        Verdict="Generator Exceeded ${TimeLimit} ms";
        _TIME=$TimeLimit;true;
    } ||
    { [ "${#err}" -gt 0 ] && {
        Verdict="Generator Runtime error";
        catch_exits;
        break;true;
    } }
        [ "$AC_CODE" = "Build_Obj/AC.C++" ] &&
            { TIME "./Build_Obj/AC.C++ < Generator/Stress_input.in > Coding_AC/AC_Output.in"; true; } || 
    { 
        [ "$AC_CODE" = "Coding_AC/AC_Solution.class" ] &&
            { TIME "java Coding_AC/AC_Solution < Generator/Stress_input.in > Coding_AC/AC_Output.in"; true; } ||
    {
        [ "$AC_CODE" = "Coding_AC/dist/AC_Solution" ] &&
            { TIME "Coding_AC/dist/AC_Solution < Generator/Stress_input.in > Coding_AC/AC_Output.in"; true; } ||
            { echo "AC Wrong Language"; }
    } }
    
    if [ "${#err}" -gt 0 ]
        then
        Verdict="AC Code Runtime error"
        catch_exits
        break;
    elif [ "$_TIME" -gt $TimeLimit ]
        then
        Verdict="Accepted Code TLE"
        _TIME=$TimeLimit
    fi
        [ "$WA_CODE" = "Build_Obj/WA.C++" ] &&
            { TIME "./Build_Obj/WA.C++ < Generator/Stress_input.in > Coding_WA/WA_Output.in"; true; } || 
    { 
        [ "$WA_CODE" = "Coding_WA/WA_Solution.class" ] &&
            { TIME "java Coding_WA/WA_Solution < Generator/Stress_input.in > Coding_WA/WA_Output.in"; true; } ||
    {
        [ "$WA_CODE" = "Coding_WA/dist/WA_Solution" ] &&
            { TIME "Coding_WA/dist/WA_Solution < Generator/Stress_input.in > Coding_WA/WA_Output.in"; true; } ||
            { echo "WA Wrong Lanaaguage"; }
    } }

    cur=$(diff -w Coding_AC/AC_Output.in Coding_WA/WA_Output.in)
     if [ "$Verdict" == "Accepted" ]
        then
        if [ "${#err}" -gt 0 ]
            then
                Verdict="Runtime error"
                catch_exits
                break;
        elif [ "$_TIME" -gt $TimeLimit ]
            then
            Verdict="Time Limit Exceeded"
            _TIME=$TimeLimit
        elif [ "${#cur}" == 0 ]
            then
                Verdict="Accepted"
        else
                Verdict="Wrong Answer"
        fi
    fi
    Out $loop "Generator 1." $LANG "" "0" "0"
    # sleep 0.05
    echo -e -n "\r\033[K"
    Out $loop "Generator 1.." $LANG "" "0" "0"
    # sleep 0.05
    echo -e -n "\r\033[K"
    Out $loop "Generator 1✔️" $LANG "$Verdict" $_TIME "NOT_SPECIFIED"
    echo
    loop+=1
#  Out $loop "Generator 1" "C++" "$Verdict" 500 600
done
echo -e "$Borders==========================================================================================================="
echo -e -n "\e[1;0m"
exit
echo -e -n "\e[1;36m"
echo "Outputting Answers..."
echo -e -n "\e[1;0m"
declare -a Samples;
declare -a Output;
declare -a AC;
declare -i i=0;
declare -i WA=0;
IFS=$'\r\n' GLOBIGNORE='*' command eval  'Samples=($(cat Coding_AC/AC_Output.in))'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'Output=($(cat Coding_WA/WA_Output.in))'
for (( i=0 ; i < ${#Output[@]} ; i++ ))
 do
    if [ $i == ${#Samples[@]} ]
        then
            WA=1;
    elif [ "${Output[$i]}" != "${Samples[$i]}" ]
        then
            WA=1;
    fi
done
if [ "$WA" -ne 1 ]
then
    echo -e "\e[1;32mAccepted \e[0m"
else
    echo -e "\e[1;31mWrong Answer \e[0m"
    echo "__________"
    echo -e -n "\e[1;32m"
    for (( i=0 ; i < ${#Samples[@]} ; i++ ))
        do
        echo " "${Samples[i]}
    done
    echo -e -n "\e[0m"
    echo "__________"
    for (( i=0 ; i < ${#Output[@]} ; i++ ))
        do
        # echo ${Output[i]} " == " ${Samples[i]}
        if [ $i -ge ${#Samples[@]} ]
            then
                echo -e -n "\e[1;31m"
        elif [ "${Output[$i]}" == "${Samples[$i]}" ]
            then
                AC[$i]=1;
                echo -e -n "\e[1;32m"

        else
                echo -e -n "\e[1;31m"
        fi
        echo " "${Output[i]}
    done
    echo -e -n "\e[0m"
    echo "__________"
fi