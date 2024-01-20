import router from '@ohos.router'
@Component
struct MainHeader{
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
    }
    .width('95%')
    .height(30)

  }
}