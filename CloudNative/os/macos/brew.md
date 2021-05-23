> brew

[Homebrew](http://brew.sh/index_zh-cn.html)

> 镜像源

[清华大学源](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)

中科大镜像源

brew
http://brew.sh/index_zh-cn.html

> 安装

```sh
### 安装Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
### 切换软件源
cd "$(brew --repo)"
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
或者
cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
### 然后执行
brew update
```

> 用法

```sh
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew.git
brew update
brew insatll lynx
```

> on mac

```sh
brew install mongodb
brew install cowsay
brew isntall rar
brew insatll tmux
brew install python
brew install coreutils
brew install macvim
brew linkapps macvim
brew install macvim --env-std --with-override-system-vim
brew install https://raw.github.com/Homebrew/homebrew-dupes/master/gdb.rb
brew install aria2
brew install vim
brew install the_silver_searcher
brew install ctags
```

305

306 brew update

311 git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew.git

324 cp -R homebrew/.git /usr/local/

325 cp -R homebrew/Library /usr/local/

327 cd homebrew

333 rm -rf homebrew

793

796 launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

817 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/brew.git

818 cd /usr/local/Library/Taps/homebrew/homebrew-core

819 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew-core.git

820 brew update

994 brew install cowsay

1098 brew outdated

1099 brew update

1103 brew update

1296 brew isntall rar

1297 brew install rar

1298 brew update

1406

1407 brew install lynx

1417 brew update

1418 brew

1419 brew update

1420 sduo brew update

1421 sudo brew update

1423 brew update

1424 brew

1426 brew

1427 brew update

1428 homebrew

1907 sudo

1908 sudo brew install tmux

1909 brew

1910 where brew

1911 /usr/bin/ruby -e "\$(curl -fsSL https://raw.githubusercontent.com/Homebre/install/master/install)"

1912 where brew

1915 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

1916 ls Homebrew

1917 cd Homebrew

1920 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

1923 cd /usr/local/Library/Taps/homebrew/homebrew-core

1924 where homebrew-core

1926 where homebrew

1927 find homebrew-core

1928 find homebrew

1931 cd Homebrew

1937 cd homebrew/homebrew-core

1939 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

1940 brew update

1950 /usr/local/Homebrew

1952 cd Library/Taps/homebrew/homebrew-core/

1970 brew install tmux

1972 brew

1973 brew update

1974 brew search tmux

1975 brew install tmux

1978 brew install tmux

1980 sudo brew install tmux

1981 brew install tmux

1984 rm -rf Homebrew

1986 brew

1987 git clone https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

1990 ls brew

1991 brew

1992 brew install

1995 cd Library/Homebrew/

1999 brew

2001 /usr/local/brew/bin/brew ; exit;

2002 /usr/local/brew/bin/brew install tmux

2004 /usr/bin/ruby -e "\$(curl -fsSL https://raw.githubusercontent.com/Homebre/install/master/install)"

2005 brew install brew

2006 brew install tmux

2007 brew

2008 brew update

2009 brew install tmux

2034

2047 git remote set-url origin git://mirrors.tuna.tsinghua.edu.cn/homebrew.git

2048 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/homebrew.git

2049 cd /usr/local && git remote set-url origin https://git.coding.net/homebrew/homebrew.git

2053 la Homebrew

2054 cd Homebrew

2056 git remote set-url origin git://mirrors.tuna.tsinghua.edu.cn/homebrew.git

2058 brew

2059 brew update

2060 brew edit

2062 cd "\$(brew --repo)"

2064 git remote set-url origin git://mirrors.ustc.edu.cn/brew.git

2066 brew update

2067 brew install python

2068 cd "\$(brew --repo)/Library/Taps/homebrew/homebrew-core"

2070 git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git

2147

2154 brew install macvim --env-std --with-override-system-vim

2155

2156

2158

2310 history | grep brew

2531 brew update

2639 brew update

2908

3162

3163 brew update

3164 brew

3165 brew home

3166 cd "\$(brew --repo)"

3169 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

3170 cd "\$(brew --repo)/Library/Taps/homebrew/homebrew-core"

3171 git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

3172 brew update

3251 brew update

3391

3612

3613
