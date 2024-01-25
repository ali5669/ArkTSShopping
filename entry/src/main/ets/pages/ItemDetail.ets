import router from '@ohos.router'
import {MainHeader} from '../components/MainHeader/MainHeader'
import { Item } from '../viewmodel/ItemModel'
import { ItemData } from '../viewmodel/ItemData'

@Entry
@Component
struct ItemDetail {
  // private item:Item
  @State params: any = router.getParams()
  @State item: Item = ItemData.find(item => item.id == this.params.id)
  build() {
    Column() {
      MainHeader()

      List(){
        ListItem(){
          Column(){
            //图片
            Row(){
              Image(this.item.image)
                .width('100%')
            }
            .margin({bottom:30})
            .constraintSize({maxHeight:'60%'})
            //价格
            Row(){
              Text('￥').fontColor('#F36').fontSize(20)
              Text(this.item.price.toString())
                .fontColor('#F36')
                .fontSize(30)
            }
            .width('90%')
            .margin({bottom:20})
            // .justifyContent(FlexAlign.Start)

            //商品名字
            Row(){
              Text(this.item.title)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
            }
            .width('90%')
            .margin({bottom:30})


            //评论标题
            Row(){
              Text('买家评论')
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
            }
            .width('90%')
            .margin({bottom:10})

            //具体评论
            if(this.item.reviews&&this.item.reviews.length){
              ForEach(
                this.item.reviews,
                review=>{
                  Column(){
                    Row(){
                      Image($r('app.media.touxiang'))
                        .width(35).padding(5)
                      Text('匿名买家').margin({left:10})
                    }.width('90%')

                    Row(){
                      Text(review)
                        .fontSize(18)
                    }
                    .width('80%')
                    .margin({bottom:10})
                  }
                  .backgroundColor('#F8F8F8')
                  .border({width:9,color:"#F8F8F8",radius:10})
                  .margin({bottom:15})
                }
              )
            }
            else {
              Text('无')
            }


          }
        }
      }
      .height('88%')



      //加入购物车
      Row(){
        Button('加入购物车')
          .width('40%')
          .height('60%')
          .fontSize(22)
          .backgroundColor('#FFCB01')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/CashPage',
              params:{
                id: this.item.id,
                type: 0
              }
            },
              (err) => {
                if (err) {
                  console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
                }
              })
          })

        Button('立即购买')
          .width('40%')
          .height('60%')
          .fontSize(22)
          .backgroundColor('#F8332D')
          .onClick(()=>{
          router.pushUrl({
            url: 'pages/CashPage',
            params:{
              id: this.item.id,
              type: 1
            }
          },
            (err) => {
              if (err) {
                console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
              }
            })
        })

      }
      .width('100%')
      .height('6%')
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .position({y:'94%' })

    }
    .height('100%')
  }
}