dotfiles
========

My current set of configuration files for URxvt, Z shell and Vim.-


## For VIM

1. Set up [Vundle]:

   `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Install the plugins:

   Launch `vim` and run `:BundleInstall`

### Manually installing YouCompleteMe in case of failure
3. Enable semantic completion support for C-family languages in YCM.

3.1. Compile the `ycm_support_libs` libraries that YCM needs. These libs
    are the C++ engines that YCM uses to get fast completions. `cmake` and
    the Python headers are needed

3.2. We'll create a new folder where build files will be placed. Run the
     following:

   ```
   cd /tmp
   mkdir ycm_build
   cd ycm_build
   ```

3.3. Run the following command in the `ycm_build` directory:

   ```
   cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
   ```

3.4. Now that makefiles have been generated, simply run:

   ```
   make ycm_support_libs
   ```

3.5. Running the `make` command will also place the `libclang.[so|dylib]` in the
     `YouCompleteMe/third_party/ycmd` folder for you if you compiled with clang
     support (it needs to be there for YCM to work).
