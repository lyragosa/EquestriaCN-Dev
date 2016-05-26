# EquestriaCN Web API List

**EquestriaCN (EQCN) Web API 汇总列表**

Lyragosa 整理

## Overview

所有API起始前缀 http://www.equestriacn.com/?rest_route=

本文件仅为一个非常简略的接口中文说明。

**目前不对下表以外的产品保证 API 可用性**

* EquestriaCN 手机客户端 iOS 版

## 元接口

REQUEST：<http://www.equestriacn.com/?rest_route=/>

返回：

所有接口列表，用于查询本文件中未列明之接口和参数

## 分类

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/categories>

返回：

所有分类信息，一般短时间不改变，可以缓存至本地

```
[
  {
    "id": 393, //分类ID
    "count": 0, //该分类下文件总数
    "description": "", //分类描述
    "link": "http://www.equestriacn.com/?cat=393", //分类直接访问链接，无用
    "name": "PMV推荐", //分类名
    "slug": "pmv", //分类唯一TAG
    "taxonomy": "category",  //无用
    "parent": 7, //上级分类ID 
    "_links": { //无用
      "self": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/categories/393"
        }
      ],
      "collection": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/categories"
        }
      ],
      "about": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/taxonomies/category"
        }
      ],
      "up": [ 
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/categories/7"
        }
      ],
      "https://api.w.org/post_type": [
        {
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Fposts&categories=393"
        }
      ]
    }
  },
  {
    //可能有多个
  },
]
```

## 根据[一定条件]取出文章

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/posts>

不加任何参数的情况下，返回最近的文章，也就是**时间线（Feed）**

可用参数（包含，但不限于以下，下同）

* page 第几页，默认第1
* per_page 每页需要多少文章
* search 搜索文章内容（wordpress内部搜索）
* author 列出特定作者ID的文章
* categories 列出特定分类的文章

返回

```
[
  {
    "id": 6082, //文章ID
    "date": "2016-05-23T10:01:27", //文章发布本地（北京）时间
    "date_gmt": "2016-05-23T02:01:27", //文章发布GMT+0时间
    "guid": {
      "rendered": "http://www.equestriacn.com/?p=6082" //文章直接访问链接
    },
    "modified": "2016-05-23T10:01:27", //最后修改北京时间
    "modified_gmt": "2016-05-23T02:01:27", //最后修改GMT+0时间
    "slug": "%e6%88%91%e7%9a%84%e5%b0%8f%e9%a9%ac%e9%a9%b9%ef%bc%9a%e5%8f%8b%e8%b0%8a%e6%98%af%e9%ad%94%e6%b3%95-%e7%ac%ac%e5%85%ad%e5%ad%a3-%e7%ac%ac9%e9%9b%86-%e5%bc%80%e5%bc%a0%e5%b9%95%e5%90%8e", //文章唯一标识（应该无用）
    "type": "post", 
    "link": "http://www.equestriacn.com/?p=6082", //还是访问链接
    "title": {  //文章标题
      "rendered": "我的小马驹：友谊是魔法 第六季 第9集 开张幕后" 
    },
    "content": { //文章内容，全文HTML编码，已经安全转义
      "rendered": "<p>（<a href=\"https://www.derpiboo.ru/1159775\" target=\"_blank\">Sweep</a>，作者：<a href=\"http://ncmares.tumblr.com/\" target=\"_blank\">ncmares</a>）</p>\n<p>新的这一集中采用的之前从未用过的倒叙插叙手法来讲述故事。瑞瑞的五个朋友一开场就着急的想去阻止瑞瑞阅读报纸上关于她在马哈顿新店的文章，到底是什么事情让大家这么紧张呢……？</p>\n<p>Bilibili链接：http://www.bilibili.com/video/av4735160/</p>\n<p><embed height=\"415\" width=\"544\" quality=\"high\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\" src=\"http://static.hdslb.com/miniloader.swf\" flashvars=\"aid=4735160&#038;page=1\" pluginspage=\"http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash\"></embed></p>\n" 
    },
    "excerpt": { //文章的简述/索引/摘要
      "rendered": "<p>（Sweep，作者：ncmares） 新的这一集中采用的之前从未用过的倒叙插叙手法来讲述故事。瑞瑞的五个朋友一\n<div class=\"read-more\"><a href=\"http://www.equestriacn.com/?p=6082\" title=\"阅读更多\">阅读更多</a></div>\n"
    },
    "author": 11, //作者ID
    "featured_media": 6083, //头图编号
    "comment_status": "open", //是否允许评论
    "ping_status": "closed", 
    "sticky": false, 
    "format": "standard",
    "categories": [ //文章所属分类ID
      5,
      64
    ],
    "tags": [], //文章所属标签
    "_links": {
      "self": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/posts/6082"
        }
      ],
      "collection": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/posts"
        }
      ],
      "about": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/types/post"
        }
      ],
      "author": [
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/users/11"
        }
      ],
      "replies": [
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Fcomments&post=6082"
        }
      ],
      "version-history": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/posts/6082/revisions"
        }
      ],
      "https://api.w.org/featuredmedia": [
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/media/6083"
        }
      ],
      "https://api.w.org/attachment": [
        {
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Fmedia&parent=6082"
        }
      ],
      "https://api.w.org/term": [
        {
          "taxonomy": "category",
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Fcategories&post=6082"
        },
        {
          "taxonomy": "post_tag",
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Ftags&post=6082"
        }
      ]
    }
  },
  {
    //可能有多个
  }
]
```

## 以某个文章ID列出 [单篇文章]

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/posts&filter[p]=ID>

例如 <http://www.equestriacn.com/?rest_route=/wp/v2/posts&filter[p]=6082>

返回格式与 **列出文章列表** 相同

## 按照 [一定条件] 取得媒体库

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/media>

默认情况将返回 **最近上传的媒体文件** ，可先行缓存，增加项目的首页/首屏打开速度

可使用下列参数：

* page 第几页，默认第1
* per_page 每页需要多少项目，默认10，可调大这个项目来预读
* before 以 ISO8601 格式的日期，返回**在这个日期之前**上传的媒体文件  例：（2004-05-03T17:30:08+08:00）

返回：

```
[
  {
    "id": 6128, //媒体ID
    "date": "2016-05-24T17:47:21", //上传日期
    "date_gmt": "2016-05-24T09:47:21",
    "guid": { 
      "rendered": "http://www.equestriacn.com/?attachment_id=6128"
    },
    "modified": "2016-05-24T17:47:21",
    "modified_gmt": "2016-05-24T09:47:21",
    "slug": "20160524_174721",
    "type": "attachment",
    "link": "http://www.equestriacn.com/?attachment_id=6128",
    "title": {
      "rendered": "QQ图片20160522135820.png"
    },
    "author": 11,
    "comment_status": "open",
    "ping_status": "closed",
    "alt_text": "",
    "caption": "",
    "description": "",
    "media_type": "image",
    "mime_type": "image/png",
    "media_details": {  //媒体物理地址URI
    //下述列表中有不同尺寸的图，可自行选用
    //full一栏中为全尺寸图片
    //每一栏中的 width 和 height 标明了尺寸
      "width": 1920,
      "height": 1080,
      "file": "2016/05/20160524_174721.png",
      "sizes": {
        "thumbnail": {
          "file": "20160524_174721-150x150.png",
          "width": 150,
          "height": 150,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-150x150.png"
        },
        "medium": {
          "file": "20160524_174721-300x169.png",
          "width": 300,
          "height": 169,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-300x169.png"
        },
        "medium_large": {
          "file": "20160524_174721-768x432.png",
          "width": 768,
          "height": 432,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-768x432.png"
        },
        "large": {
          "file": "20160524_174721-1024x576.png",
          "width": 1024,
          "height": 576,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-1024x576.png"
        },
        "post-thumbnail": {
          "file": "20160524_174721-110x96.png",
          "width": 110,
          "height": 96,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-110x96.png"
        },
        "main-full": {
          "file": "20160524_174721-1078x516.png",
          "width": 1078,
          "height": 516,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-1078x516.png"
        },
        "main-slider": {
          "file": "20160524_174721-702x336.png",
          "width": 702,
          "height": 336,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-702x336.png"
        },
        "main-block": {
          "file": "20160524_174721-351x185.png",
          "width": 351,
          "height": 185,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-351x185.png"
        },
        "slider-small": {
          "file": "20160524_174721-168x137.png",
          "width": 168,
          "height": 137,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-168x137.png"
        },
        "gallery-block": {
          "file": "20160524_174721-214x140.png",
          "width": 214,
          "height": 140,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-214x140.png"
        },
        "grid-overlay": {
          "file": "20160524_174721-343x215.png",
          "width": 343,
          "height": 215,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721-343x215.png"
        },
        "full": {
          "file": "20160524_174721.png",
          "width": 1920,
          "height": 1080,
          "mime_type": "image/png",
          "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721.png"
        }
      },
      "image_meta": {
        "aperture": "0",
        "credit": "",
        "camera": "",
        "caption": "",
        "created_timestamp": "0",
        "copyright": "",
        "focal_length": "0",
        "iso": "0",
        "shutter_speed": "0",
        "title": "",
        "orientation": "0",
        "keywords": []
      }
    },
    "post": null,
    "source_url": "http://www.equestriacn.com/wp-content/uploads/2016/05/20160524_174721.png", //原图地址
    "_links": {
      "self": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/media/6128"
        }
      ],
      "collection": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/media"
        }
      ],
      "about": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/types/attachment"
        }
      ],
      "author": [
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/users/11"
        }
      ],
      "replies": [
        {
          "embeddable": true,
          "href": "http://www.equestriacn.com/?rest_route=%2Fwp%2Fv2%2Fcomments&post=6128"
        }
      ]
    }
  },
  {
  	//可能有多个
  }
]
```

## 以某个媒体ID列出 [单个媒体文件信息]

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/media&filter[p]=ID>

例如 <http://www.equestriacn.com/?rest_route=/wp/v2/media&filter[p]=6083>

返回格式与 [列出媒体库] 相同

## 列出 [最近发过文章] 的 [用户信息列表]

REQUEST：<http://www.equestriacn.com/?rest_route=/wp/v2/users>

可用于先行缓存。

**不一定内含所有用户！**

可使用类似 &per_page=100 参数多缓存一些用户（似乎不能写太多）
翻页使用 &page=x  与前述接口相同

返回：

```
[
  {
    "id": 18, //用户ID
    "name": "Astrolumos", //用户名
    "url": "",
    "description": "", //用户的一段描述（Bio）
    "link": "http://www.equestriacn.com/?author=18",
    "slug": "astrolumos",
    "avatar_urls": { //三种尺寸的用户头像 物理地址
      "24": "http://0.gravatar.com/avatar/6e0cad613f1c10348c8a44ff111645b4?s=24&d=wp_user_avatar&r=g",
      "48": "http://0.gravatar.com/avatar/6e0cad613f1c10348c8a44ff111645b4?s=48&d=wp_user_avatar&r=g",
      "96": "http://0.gravatar.com/avatar/6e0cad613f1c10348c8a44ff111645b4?s=96&d=wp_user_avatar&r=g"
    },
    "_links": {
      "self": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/users/18"
        }
      ],
      "collection": [
        {
          "href": "http://www.equestriacn.com/?rest_route=/wp/v2/users"
        }
      ]
    }
  },
  {
  	//可能有多个
  }
]
```

## 以某个用户ID列出 [单个用户信息]

REQUEST <http://www.equestriacn.com/?rest_route=/wp/v2/users/ID]>

例如 <http://www.equestriacn.com/?rest_route=/wp/v2/users/12>

返回格式与上相同

