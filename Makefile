all: build_Generator build_AC build_WA return

build_Generator : Build_Obj/Generator
build_AC : $(AC_CODE)
build_WA : $(WA_CODE)

Build_Obj/Generator : Generator/Stress_Generator.cpp
	@g++ -O3 -std=c++17  -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -w -Wshadow -Wall -o Build_Obj/Generator -g Generator/*.cpp

Build_Obj/AC.C++ : Coding_AC/AC_Solution.cpp
	@g++ -O2 -std=c++17  -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -w -Wshadow -Wall -o Build_Obj/AC.C++ Coding_AC/AC_Solution.cpp
Coding_AC/AC_Solution.class : Coding_AC/AC_Solution.java
	@javac Coding_AC/AC_Solution.java
Coding_AC/dist/AC_Solution : Coding_AC/AC_Solution.py
	@cd Coding_AC;python3 -m PyInstaller -F AC_Solution.py 2>/dev/null

Build_Obj/WA.C++ : Coding_WA/WA_Solution.cpp
	@g++ -O2 -std=c++17  -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g -w -Wshadow -Wall -o Build_Obj/WA.C++ Coding_WA/WA_Solution.cpp
Coding_WA/WA_Solution.class : Coding_WA/WA_Solution.java
	@javac Coding_WA/WA_Solution.java
Coding_WA/dist/WA_Solution : Coding_WA/WA_Solution.py
	@cd Coding_WA;python3 -m PyInstaller -F WA_Solution.py 2>/dev/null
return: 
	@echo -n 