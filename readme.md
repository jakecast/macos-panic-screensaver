![screensaver](https://github.com/jakecast/macos-panic-screensaver/blob/406d6828994d6068747aff77fca598d2f5573a3a/screensaver.gif)

## Panic Sign Screen Saver

A macOS screensaver based on the logo of shockingly good software creator, Panic Inc.
It is rendered using SceneKit and there are options to change the colors or to have the colors match the current Panic sign colors from [sign.panic.com](https://sign.panic.com)

## Drawing Paths
The bouncing logo is made up of three shapes, the outer circle (comprised of an upper and lower section) and the letter P, comrpised of a primary bezier path and a masking path for the center.

They are drawn using the following layout and point system.

**Circle Path**

```
                                    
                                    0
                            ╔══════════════╗               
                  19   ╔════╝              ╚════╗    1
                   ╔═══╝                        ╚═══╗      
            18   ╔═╝                                ╚═╗       
               ╔═╝                                    ╚═╗   2   
             ╔═╝                                        ╚═╗   
       17  ╔═╝                                            ╚═╗      
          ╔╝                                                ╚╗   3 
         ╔╝                                                  ╚╗   
    16  ╔╝                                                    ╚╗
       ╔╝                                                      ╚╗   4
       ║                                                        ║
    ╔==╝                                                        ╚==╗
    ║                                                              ║
15  ║                                                              ║   5
    ║                                                              ║
    ║                                                              ║
    ╚==╗                                                        ╔==╝
       ║                                                        ║
       ╚╗                                                      ╔╝
    14  ╚╗                                                    ╔╝   6
         ╚╗                                                  ╔╝
          ╚╗                                                ╔╝
       13  ╚═╗                                            ╔═╝   7
             ╚═╗                                        ╔═╝
               ╚═╗                                    ╔═╝
            12   ╚═╗                                ╔═╝    8
                   ╚═══╗                        ╔═══╝
                  11   ╚════╗              ╔════╝    9
                            ╚══════════════╝     
                                   10
```


**Letter Path**

```
            5 ________________ 6
             /               /
            / 1 ________ 2  /
           /   /       /   /
          /   /_______/   /
         /   0        3  /
        /   ____________/ 7
       /   / 8
      /   /
   4 /___/ 9
```


## License
[GNU General Public License 3.0](https://raw.githubusercontent.com/JohnCoates/Aerial/master/LICENSE)