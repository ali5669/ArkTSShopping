import router from '@ohos.router'
@Component
export struct MainHeader{
  build(){
    Row({space:5}){
      Image($r('app.media.ic_public_back'))
        .width(30)
        .onClick(()=>{
          router.back()
        })
      Blank()
      Image($r('app.media.ic_public_refresh'))
        .width(30)
        .onClick(()=>{

        })
    }
    .width('95%')
    .height(30)
    .margin({top:10,left:10,right:10})
  }
}