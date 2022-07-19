# Strees Testing
 

<p align="center">
  <img  src="https://user-images.githubusercontent.com/72987571/179564364-c52ea4f8-3872-4f63-81e9-4a129f953b4e.png">

<h4 align="center"><strong>
Stress-Testing is a project that ensures the ability of a program to work correctly under predefined conditions. 

it is used mostly in competitive programming and developing algorithms.
</strong></h4>
</p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-blue.svg)

# Basic Overview

>**The General Problem most of programmers face** 
><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  when they **create** an **algorithm** to **solve** specific **issue** they are **not sure** that this algorithm **works correctly** for all cases that may happen.

>**Now comes our solution.** 
><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  We can create **brute force code** that work **very slow** and give him big number of **test cases** and **compare its output** with our **algorithm output** and see **if** it **passes** all these test cases.


<p align="center">
  <img  src="https://user-images.githubusercontent.com/72987571/179570973-ccea7bbb-4c31-411d-b5d1-be0e639aef5e.gif" width="1000">
</p>

# Features

  * You don't have to **create Code to Generate** random **test cases** at all.
  * **Test Cases** are **Generated** by **given generator as you like**. ( Saves more time in working )
  * **Random** Test Cases are generated using **uniformly distribution generators**.
  * Available Languages : **C++, Java, Python**.
  * You can Strees test **2 Codes** with **different languages**.
  * **Overflows** and **sigmantation fault** and **compilation error** are detected and the program returns useful **message** to **help** you **fix the issue**.
  * **Time Limit Exceeded** for the WA code ( **the algorithm** ) are detected and the program returns **Time Limit Exceeded**.
  * **Time Limit Exceeded** for the AC code ( **the bruteforce** ) are detected and the program returns **AC Time Limit Exceeded** to tell you that the **brute force** are **too slow to run**.
  * **Files** that are **only used** and **only have changes** are the ones who are **only compiled again** otherwise the program runs. ( Saves more time in working )
  * **Running Time** of the WA code ( **the algorithm** ) are being **measured** to tell you the **average running time** of **the algorithm**.
  * The **program** are **highlited** to be **comfortable** for the user.

# Limitations

  * Only **C++, Python** and **Java** are available to use till now!.
  * **Predefined test cases** that have **special properties** must get their **own generator written from scratch**.
  * **Memory** of the running **algorithm** are **not** being **measured**.
  * **Can't use Custom Generators**

# How To Use
## &nbsp;&nbsp;&nbsp; Get **local copy** of the project on your PC.
```bash
git clone https://github.com/SHABRAWii/Strees-Testing.git
```
## &nbsp;&nbsp;&nbsp; Get All Dependencies
&nbsp; If you are using **Windows** make sure you have **bash** installed. For me when I have **Windows Subsystem Linux (WSL)** so I **can** use **bash**.
```bash
chmod +x init.sh         # make init.sh file excutable
./init.sh                # run init.sh and type your (WSL) password and it will install all requirements
```
## &nbsp;&nbsp;&nbsp; Configure The Stress Testing Type
&nbsp; In **Stress_Test.sh** file Edit these three parameters
  * "*TimeLimit=?*" Enter the time limit for your algorithm.
  * "*AC_CODE=?*" Enter the Accepted Code Language you will use. ( Brute Force )
  * "*WA_CODE=?*" Enter the Wrong Answer Code Language you will use. ( Algorithm )
![carbon (1)](https://user-images.githubusercontent.com/72987571/179629968-81356f9c-08ec-42de-aa4c-4da2f02062b2.svg)

>**Note,** that if you want to edit the **Time limit** of the **Accepted Code** or the Time limit of the **Generator Code**.
> * For **Accepted Code** 
> ```bash
> 173: inc=1000 ## This line for detemining the Generator Code Time Limit
> ... ## Note that both increment values are added to the predefined Time Limit Value
> ... ##     we declared above to get the total Time Limit for each of them
> ```
> * For **Generator Code** 
> ```bash
> 184: inc=3000 ## This line for detemining the Accepted Code Time Limit
> ... ## Note that both increment values are added to the predefined Time Limit Value
> ... ##     we declared above to get the total Time Limit for each of them
>```
## &nbsp;&nbsp;&nbsp; Edit The Algorithm and Brute force files

> **For the Accepted Code you have "Coding_AC" Folder Which Contains**
#### Same Goes for "**Coding_WA**" but that is for `Wrong Answer ( The Algorithm )` Solution 
<img align="right" width="500"  src="https://user-images.githubusercontent.com/72987571/179706327-0a068b02-3042-4e5d-af45-344e0122d10d.png">

> * **AC_Output.in**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This contains The Output of the Accepted Code that 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; are being compared with the wrong one**. If you got 
> <br> &nbsp; &nbsp; &nbsp;&nbsp;**`Wrong Answer`**, you can see this output and the other code 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; output or use **<a href="https://saythanks.io/to/bullredeyes@gmail.com"> Sampling Comparetor </a>** which we will $$$$$$$$$$$$$$$$
> <br> &nbsp; &nbsp; &nbsp;&nbsp; mention later.
> * **AC_Solution.class**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is last excutable file** generated from **`AC_Solution.java`** 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; **Don't worry about it nothing need to do here**
> * **AC_Solution.cpp**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is your `Accpted (Brute force)` Solution** If you 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; will use **C++** Programming language.
> * **AC_Solution.java**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is your `Accpted (Brute force)` Solution** If you 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; will use **Java** Programming language.
> * **AC_Solution.py**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is your `Accpted (Brute force)` Solution** If you will use **Python** Programming language.
> * **AC_Solution.spec**       :
>  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This file tells PyInstaller how to process your script.**
> <br> &nbsp; &nbsp; &nbsp;&nbsp; **Don't worry about it nothing need to do here**
> * **dist/AC_Solution**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is last excutable file** generated from **`AC_Solution.py`** 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; **Don't worry about it nothing need to do here**

## &nbsp;&nbsp;&nbsp; Generate Random test cases using the Generator
### &nbsp;&nbsp;&nbsp; Using Current Generator system:

> **For the Test cases Generation Proccess you have "Generator" Folder Which Contains**
<img align="right" width="500"  src="https://user-images.githubusercontent.com/72987571/179711109-f80fa49a-70cc-48eb-8476-f589e4f84439.png">

> * **Generator.in**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This where you type how you want your test case to 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; look like**. see
**<a href="https://saythanks.io/to/bullredeyes@gmail.com"> Generator_Commands.md </a>** file for further
> <br> &nbsp; &nbsp; &nbsp;&nbsp; information 
> * **Stress_Generator.cpp**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is Code translate your commands** in 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; `Generator.in` and Generate random test cases and put it
> <br> &nbsp; &nbsp; &nbsp;&nbsp; in `Stress_input.in`.
> <br> &nbsp; &nbsp; &nbsp;&nbsp; **Don't worry about it nothing need to do here**
> * **Stress_input.in**       :
> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **This is the generated test case**. If the program stops and you got **Over flows** or **Segmentation Fault** or **Wrong Answer** then 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; this is the test case which your **Algorithm fails in**. **Trace** your **Solution ( Algorithm )**, **find** the **mistake**, try this test case again and 
> <br> &nbsp; &nbsp; &nbsp;&nbsp; compare your output with the Accepted Output. You will get a successfull Solution ✔️.

## &nbsp;&nbsp;&nbsp; Run the Stress_Test Program
```bash
bash Stress_Test.sh
```

## Contributing
Please take a look at our **[contributing](https://github.com/anfederico/clairvoyant/blob/master/CONTRIBUTING.md)** guidelines if you're interested in helping!
#### Pending Features
- adding more languages.
- Create Custom_Testing files using various languages.
- Measure used memory while the algorithm are working.







