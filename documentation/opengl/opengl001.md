1.send vertex info to GPU

A.generate a buffer : glGenBuffers()

B.bind the buffer: glBindBuffers()

C.glBufferData()

vertex shader

example: RWTSimpleVertex.glsl

```
attribute vec4 a_Position;

void main(void) {
    gl_Position = a_Position;
}
```



**Fragment shader**

```
//RWTSimpleFragment.glsl

void main(void) {
    gl_Fragcolor = vec4(1,1,1,1);
}
```



```
- (void)setupShader {
    _shader = [[RWTBaseEffect alloc] initwitVer]
}
```

