# SPHERE转WAV
使用 [sph2pipe](https://www.ldc.upenn.edu/language-resources/tools/sphere-conversion-tools) 程序可以很方便的将 SPHERE 格式的音频数据转换为 WAV 格式的音频数据，在 linux 系统下命令形式如下：
```sh
./sph2pipe -f wav source.sph > dest.wav
```

sph2pipe 是由 [语音数据联盟](https://www.ldc.upenn.edu/)（Linguistic Data Consortium）创建，该工具可以很方便的将 SPHERE 格式的数据转换为 WAV 等其它格式的数据，在 [0readme.1st](./sph2pipe_v2.5/0readme.1st) 文档中有对该工具的详细介绍，下面快速介绍一下 linux 系统下该工具的安装和使用。

```sh
# 下载
wget https://www.ldc.upenn.edu/sites/default/files/sph2pipe_v2.5.tar.gz
# 解压
tar -xzvf /yourpath/sph2pipe_v2.5.tar.gz
# 编译为可执行程序
gcc -o sph2pipe *.c -lm
# 格式转换
./sph2pipe -f wav source.sph > dest.wav
```

sph2pipe 一次只能转换为一个文件，对于批量文件转换不是很方便，为此我写了一个 [shell](./sph2wav.sh) 脚本，使得可以对文件进行批量转换，使用形式如下，详细示例见 [Quick Start](#quick-start)：
```sh
# yourSphDir 保存着 *.sph 文件的目录，递归的形式进行文件查找
# yourSavedWavDir 转换后的 *.wav 文件保存的目录
./sph2wav.sh yourSphDir yourSavedWavDir
```

# Quick Start
1. `git clone https://github.com/coolhuhu/sph2wav.git`
2. `cd /yourpath/sph2wav`
3. `mkdir test_wav`
4. `ls -l ./test`
    ```sh
    total 412
    -rw-r--r-- 1 root root 28357 Aug  7 19:12 123_1pcbe_shn.sph
    -rw-r--r-- 1 root root 28357 Aug  7 19:12 123_1pcle_shn.sph
    -rw-r--r-- 1 root root 16053 Aug  7 19:12 123_1ulaw_shn.sph
    -rw-r--r-- 1 root root 75264 Aug  7 19:12 123_2alaw.sph
    -rw-r--r-- 1 root root 55681 Aug  7 19:12 123_2pcbe_shn.sph
    -rw-r--r-- 1 root root 55681 Aug  7 19:12 123_2pcle_shn.sph
    -rw-r--r-- 1 root root 31085 Aug  7 19:12 123_2ulaw_shn.sph
    -rw-r--r-- 1 root root  1024 Aug  7 19:12 big1.hdr
    -rw-r--r-- 1 root root  2048 Aug  7 19:12 big2.hdr
    -rw-r--r-- 1 root root 98358 Aug  7 19:12 outfile-md5.list.macosx
    -rw-r--r-- 1 root root  1024 Aug  7 19:12 std1.hdr
    -rw-r--r-- 1 root root  1024 Aug  7 19:12 std2.hdr
    -rw-r--r-- 1 root root  3962 Aug  7 19:12 test_all.pl
    ```
5. `./sph2wav.sh ./test ./test_wav`
    ```sh
    7 files in total
    /workspace/shell_demo/sph2wav/test_wav/123_2ulaw_shn.wav
    /workspace/shell_demo/sph2wav/test_wav/123_1pcle_shn.wav
    /workspace/shell_demo/sph2wav/test_wav/123_2pcle_shn.wav
    /workspace/shell_demo/sph2wav/test_wav/123_1pcbe_shn.wav
    /workspace/shell_demo/sph2wav/test_wav/123_2alaw.wav
    /workspace/shell_demo/sph2wav/test_wav/123_1ulaw_shn.wav
    /workspace/shell_demo/sph2wav/test_wav/123_2pcbe_shn.wav
    A total of 7 files were converted
    ```
6. `ls -l ./test_wav`
    ```sh
    -rw-r--r-- 1 root root  74284 Aug 11 09:20 123_1pcbe_shn.wav
    -rw-r--r-- 1 root root  74284 Aug 11 09:20 123_1pcle_shn.wav
    -rw-r--r-- 1 root root  37178 Aug 11 09:20 123_1ulaw_shn.wav
    -rw-r--r-- 1 root root  74298 Aug 11 09:20 123_2alaw.wav
    -rw-r--r-- 1 root root 148524 Aug 11 09:20 123_2pcbe_shn.wav
    -rw-r--r-- 1 root root 148524 Aug 11 09:20 123_2pcle_shn.wav
    -rw-r--r-- 1 root root  74298 Aug 11 09:20 123_2ulaw_shn.wav
    ```


# 在windows系统下进行格式转换
sph2pipe 也可以在 windows 系统环境下使用，只需在 windows 环境下重新编译即可，使用方法和在 linux 下一致。

同样地，我使用 GPT 生成了 windows 下的 [power shell](sph2wav.ps1) 脚本，但是我对 power shell 脚本熟悉，不知为什么使用 power shell 脚本转换后的 wav 格式音频文件会产生不可播放的现象，我怀疑是 sph2pipe 自带的 windows 可执行程序是在比较老的 windows 系统版本上编译的，和现有的 windows 10、11 系统兼容性不好。读者自行尝试。

此外，在 windows 系统下，可以使用 [sph_convert_2.1](https://www.ldc.upenn.edu/sites/default/files/sph_convert_v2_1.zip) 进行格式转换。