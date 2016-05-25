# EquestriaCN Web API List

**EquestriaCN (EQCN) Web API 汇总列表**

Lyragosa 整理

## Overview

所有API起始前缀 http://www.equestriacn.com/?rest_route=

## 元接口

REQUEST：<http://www.equestriacn.com/?rest_route=/>

返回：

所有接口列表，用于查询本文件中未列明之接口

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

* page 第几页，默认第一1
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
