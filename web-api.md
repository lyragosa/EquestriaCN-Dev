# EquestriaCN Web API List

**EquestriaCN (EQCN) Web API 汇总列表**

Lyragosa 整理

## Overview

所有API起始前缀 http://www.equestriacn.com/?rest_route=

## 元接口

<http://www.equestriacn.com/?rest_route=/>

返回所有接口列表，用于查询本文件中未列明之接口

## 分类

<http://www.equestriacn.com/?rest_route=/wp/v2/categories>

返回：

所有分类信息，一般短时间不改变，可以缓存至本地

```
[
  {
    "id": 393, //分类ID
    "count": 0, //该分类下文件总数
    "description": "", //分类描述
    "link": "http://www.equestriacn.com/?cat=393", //链接
    "name": "PMV推荐", //分类名
    "slug": "pmv", //分类唯一TAG，无用
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

