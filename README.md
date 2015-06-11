dotfiles
========

My current set of configuration files for URxvt, Z shell and Vim.-


## For VIM

1. Set up [Vundle]:

   `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Install the plugins:

   Launch `vim` and run `:PluginInstall`

3. Enable semantic completion support for C-family languages in YCM.

3.1. **Compile the `ycm_support_libs` libraries** that YCM needs. These libs
    are the C++ engines that YCM uses to get fast completions.

    You will need to have `cmake` installed in order to generate the required
    makefiles.

    You also need to make sure you have Python headers installed.

    Here we'll assume you installed YCM with Vundle. That means that the
    top-level YCM directory is in `~/.vim/bundle/YouCompleteMe`.

3.2. We'll create a new folder where build files will be placed. Run the
     following:

     ```shell
         cd /tmp
         mkdir ycm_build
         cd ycm_build
     ```

3.3. Run the following command in the `ycm_build` directory:

     ```shell
         cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp                                                       
     ```

3.4. Now that makefiles have been generated, simply run:

     ```shell
         make ycm_support_libs
     ```

     Running the `make` command will also place the `libclang.[so|dylib]` in the
     `YouCompleteMe/third_party/ycmd` folder for you if you compiled with clang
     support (it needs to be there for YCM to work).
