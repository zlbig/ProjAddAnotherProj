### 在现有工程中引入其他工程

> 参考资料：[Xcode 4.2 how include one project into another one?](https://stackoverflow.com/questions/9370518/xcode-4-2-how-include-one-project-into-another-one)
>
> 环境：Xcode 8.3
>
> 开始之前，我们做一些约定：
>
> 现有工程暂定为：`A-App` ，其他工程暂定为：`B-App` 

背景：`A-App` 和 `B-App` 均是独立维护的项目。现在需要把 `B-App` 作为一个模块集成到 `A-App` 中使用，`A-App` 和 `B-App` 依然进行开发迭代，`A-App` 中的 `B` 模块依然保持和 `B-App` 状态一样。



首先，在确保 Xcode 没有打开 `A-App` 和 `B-App` 的情况下，在 `A-App` 的 Finder 目录中，将 `B-App` 拷入指定文件夹（demo 中是直接放入 `A-App` 的一级目录，如图）。

![pic-1](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-1.png)



然后将 `B-App` 的 `B-App.xcodeproj` "拖进" `A-App` 中（或者在 `A-App` 的工程中通过 "add files to A-App" 的方式将 `B-App.xcodeproj` 加入 `A-App` 中）。如图。

![pic-2](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-2.png)



之后，需要将 `B-App` 添加到 `A-App` 的 Build Phases 的 Target Dependencies 和 Link Binary With Libraries 中。如图。![pic-3](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-3.png)



最后，你需要为 `B-App` 在 `A-App` 的 Build Settings 中设置 HEADER_SEARCH_PATHS。如图。其中值得注意的是，头文件路径的完整性。

![pic-4](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-4.png)



`cmd + R ` 编译运行一下 `A-App` 发现报错了。如图。![pic-5](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-5.png)



不要慌。因为 `B-App` 的文件虽然可以被 `A-App` 引用，但是这些文件在 `A-App` 的编译来源中并不存在。所以在 `A-App` 的 Build Phases 中的 Compile Sources 添加工程中需要编译的类文件。（例如 `A-App` 使用 `B-App` 中的 `B` 功能模块，需要引入 `B` 模块所涉及到的所有 `.m` 文件到 `A-App` 中。此时的操作会涉及到一些第三方库，如果 `A-App` 和 `B-App` 均有使用相同版本的 `Masonry` ，就没有必要在 `A-App` 的 Compile Sources 中再次引入；如果仅仅是 `B-App` 有使用 `Masonry` ，就有必要在 `A-App` 的 Compile Sources 中引入 `Masonry` 的文件）如图。![pic-6](/Users/zl/Desktop/TesT-s/OC-Test/projectAddProj/pic-6.png)



至此，基本上就完成在现有工程中引入其他工程的操作，你可以 `cmd + R` 运行工程了。需要提示的是，有时候，你需要往现有工程的 Build Settings 的 Other Linker Flags 中添加 `-all_load` 和 `-ObjC` 。 



##### 关于 `A-App` 中 `B-App` 的更新

1. 如果 `B-App` 中没有新增或删除类文件，就直接复制替换 `A-App` 中的 `B-App` 就行。
2. 如果 `B-App` 中有新增或删除类文件，就需要在 `A-App` 的 Build Phases 中的 Compile Sources 新增或删除对应的类文件。