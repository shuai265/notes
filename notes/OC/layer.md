



## 问题场景

### view 默认颜色的问题
```
# 老系统上两个 view 通过 new 生成，没有设置背景颜色，第一个背景透明，第二个背景黑色

<CALayer:0x127cb18f0; position = CGPoint (175 180); bounds = CGRect (0 0; 350 280); delegate = <CSQuestionChooseView: 0x127e0d9a0; frame = (0 40; 350 280); userInteractionEnabled = NO; layer = <CALayer: 0x127cb18f0>>; 
sublayers = (<CALayer: 0x127ca6bc0>, <_UILabelLayer: 0x127e3d920>, <CALayer: 0x127e0fa10>, <CALayer: 0x127e11830>, <CALayer: 0x127e08780>); opaque = YES; allowsGroupOpacity = YES; >

<CALayer:0x1267b7400; position = CGPoint (175 174.5); bounds = CGRect (0 0; 350 291); delegate = <CSQuestionConnectView: 0x127bf34d0; frame = (0 29; 350 291); layer = <CALayer: 0x1267b7400>>; 
contents = <CABackingStore 0x127cdafc0 (buffer [700 582] BGRX8888)>; sublayers = (<CALayer: 0x127cc8ef0>, <_UILabelLayer: 0x1266ebf50>, <CALayer: 0x126608850>, <CALayer: 0x127b8aed0>, <CALayer: 0x127d12a10>, <CALayer: 0x127d0f070>, <CALayer: 0x127e0b3d0>, <CALayer: 0x1265cb8a0>); opaque = YES; allowsGroupOpacity = YES; rasterizationScale = 2; contentsScale = 2>
```