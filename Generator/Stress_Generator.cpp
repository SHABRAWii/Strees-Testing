#include <iostream>
#include <sstream>
#include <algorithm>
#include <random>
#include <ctime>
#include <chrono>
#include <map>
#include <set>
#include "CustomGeneration.h"

using namespace std;
#define RESIZE_SPACE(x) x.resize(x.find_first_of(' ') - 1);

unsigned seed = std::chrono::system_clock::now().time_since_epoch().count(); 
default_random_engine Generator(seed);
map <long long, long long> NumToNum;
map <string, long long> StringToNum;
map <long long, string> NumToString;
map <string, string> StringToString;

long long getNum(long long l, long long r, string example = "NONE"){
    if(l > r) swap(l, r);
    if(example == "NONE"){
        uniform_int_distribution<long long> rand(l, r);
        return rand(Generator);
    }else if(example == "PRIME"){
        return -2;
    }
    return 0;
}
string getString(char f, char t, int siz, bool isUpper){
    char st = ((isUpper) ? 'A' : 'a');
    uniform_int_distribution<long long> rand(f - st, t - st);
    string str;
    while((int)(str.size()) < siz){
        str += (char)(rand(Generator) + st);
    }
    return str;
}
string getString(string example, int siz){
    sort(example.begin(), example.end());
    unique(example.begin(), example.end());
    example.resize((int)(set<char>(example.begin(), example.end()).size()));
    string str;
    while((int)(str.size()) < siz){
        str += example[getNum(0, example.size() - 1)];
    }
    return str;
}
void Custom(string str){
    str.pop_back();
    str.pop_back();
    if(str == "Custom_1"){
        Custom_1();
    }else if(str == "Custom_2"){
        Custom_2();
    }else if(str == "Custom_3"){
        Custom_3();
    }else if(str == "Custom_4"){
        Custom_4();
    }
}
void Analyze(string str){
    if(str[0] == '$'){
        Custom(str.substr(1));
        return;
    }
    long long l, r; // For Integer Values
    int container;  // For Specific type of Randomization
    char f, t; // For string generate from charachter $f to charachter $t
    string specific = string(100, ' '); // for type of Generation EX : array or string
    string example = string(100, ' '); // generate within these characters
    string nC = string(100, ' '); // used to get size of array
    int n = 0; // size of array
    int siz = 0; // size of string
    
    str.erase(remove(str.begin(), str.end(), ' '), str.end());// remove all spaces

    // command example : specific(a, b, c)
    if(str.substr(0, 5) == "array"){
        int cnt = count(str.begin(), str.end(), ',');
        if(cnt == 2 && str[6] != '"'){ // array(1, 3, $n)
            sscanf(str.c_str(), "%[^(](%lld,%lld,%[^)])", &specific[0], &l, &r, &nC[0]);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(nC);
            if(nC[0] == '$'){ 
                n = StringToNum[nC.substr(1)];
            }else{
                n = stoi(nC.substr(1));
            }
            for(int i = 0 ; i < n ; ++i){
                long long out = getNum(l, r);
                cout << out << " \n"[i + 1 == n];
            }
        }else if(cnt == 2){ // array("jasf", 10, $n)
            sscanf(str.c_str(), "%[^(](\"%[^\"]\",%d,%[^)])", &specific[0], &example[0], &siz, &nC[0]);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(example);
            RESIZE_SPACE(nC);
            if(nC[0] == '$'){
                n = StringToNum[nC.substr(1)];
            }else{
                n = stoi(nC.substr(1));
            }
            string out;
            for(int i = 0 ; i < n ; ++i){
                out = getString(example, siz);
                cout << out << " \n"[i + 1 == n];
            }
        }else if(cnt == 3 && isdigit(str[6])){ // array(1, 3, $n, PRIME)
            sscanf(str.c_str(), "%[^(](%lld,%lld,%[^,],%[^)])", &specific[0], &l, &r, &nC[0], &example[0]);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(example);
            RESIZE_SPACE(nC);
            if(nC[0] == '$'){
                n = StringToNum[nC.substr(1)];
            }else{
                n = stoi(nC.substr(1));
            }
            for(int i = 0 ; i < n ; ++i){
                long long out = getNum(l, r, example);
                cout << out << " \n"[i + 1 == n];
            }
        }else{
            sscanf(str.c_str(), "%[^(](%c,%c,%d,%[^)])", &specific[0], &f, &t, &siz, &nC[0]);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(nC);
            if(nC[0] == '$'){
                n = StringToNum[nC.substr(1)];
            }else{
                n = stoi(nC.substr(1));
            }
            string out;
            for(int i = 0 ; i < n ; ++i){
                out = getString(f, t, siz, (f == toupper(f)));
                cout << out << " \n"[i + 1 == n];
            }
        }
    }else if(str.substr(0, 6) == "string"){
        string out;
        if(count(str.begin(), str.end(), ',') == 1){
            sscanf(str.c_str(), "%[^(](\" %[^\"]\",%d)", &specific[0], &example[0], &siz);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(example);
            out = getString(example, siz);
        }else{
            sscanf(str.c_str(), "%[^(](%c,%c,%d)", &specific[0], &f, &t, &siz);
            RESIZE_SPACE(specific);
            out = getString(f, t, siz, (f == toupper(f)));
        }
        StringToString[specific] = out;
        cout << out << endl;
    }else{
        if(count(str.begin(), str.end(), ',') == 1){
            sscanf(str.c_str(), "%[^(](%lld,%lld)", &specific[0], &l, &r);
            RESIZE_SPACE(specific);
            long long out = getNum(l, r);
            StringToNum[specific] = out;
            cout << out << endl;
        }else{
            sscanf(str.c_str(), "%[^(](%lld,%lld,%[^)])", &specific[0], &l, &r, &example[0]);
            RESIZE_SPACE(specific);
            RESIZE_SPACE(example);
            long long out = getNum(l, r, example);
            StringToNum[specific] = out;
            cout << out << endl;
        }
    }
}
bool out = 0;
void TC(int n, bool p, string tc_str){
    if(!out){
        out = 1;
    }else if(p){
        cout << n << endl;
        p = 0;
    }
    stringstream tc(tc_str);
    for(int i = 0 ; i < n ; ++i){
        tc.clear();
        tc.seekg(0);
        string command;
        while(getline(tc, command)){
            if(command.substr(0, 2) == "tc"){
                int _n = 0;
                command = command.substr(3);
                command.pop_back();
                if(isdigit(command[0])){
                    _n = stoll(command);
                }else{
                    command.pop_back();
                    command = command.substr(1);
                    _n = StringToNum[command];
                }
                stringstream _tc;
                string _command;
                int OPEN = 1;
                while(getline(tc, _command)){
                    if(_command.substr(0, 2) == "tc")
                        ++OPEN;
                    if(_command[0] == '}')
                        --OPEN;
                    if(!OPEN)
                        break;
                    _tc << _command << endl;
                }
                TC(_n, p, _tc.str());
            }else{
                Analyze(command);
            }
        }
    }
    return;
}
void Do(){
    string str;
    stringstream tc;
    while(getline(cin, str)){
        str.erase(remove(str.begin(), str.end(), ' '), str.end());// remove all spaces
        tc << str << endl;
    }
    TC(1, 1, tc.str());
    return;
}
int main(){ 
    #ifdef VS_FreeOpen 
        freopen("Generator.in", "r", stdin); 
        freopen("Stress_input.in", "w", stdout); 
    #else
        freopen("Generator/Generator.in", "r", stdin); 
        freopen("Generator/Stress_input.in", "w", stdout); 
    #endif

    Do();

    return 0; 
} 