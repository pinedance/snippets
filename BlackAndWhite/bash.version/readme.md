작업에 주로 사용할 것은 ImageMagick의`convert`와 `-threshold` 옵션이다. 이 옵션에는 `-channel`을 함께 써주는 경우가 있는데, RGB 색의 종류를 표시한다. 아무것도 쓰지 않으면 `-channel RGB`와 같은 의미이다. 

만약 `-channel red -threshold 50%`이라고 하면 전체 pixel에서 상위 50%의 red는 100% red값으로, 하위 50%의 red는 0의 값으로 바꾸어 준다. 

컬러 이미지를 출력에 적합하도록 검은색과 흰색으로 표시하려면 주로 다음과 같이 하면 된다. 

```bash
convert before.jpg -threshold 50% after_50.jpg
```

참고로 PDF를 image로 변환하지 않고 그대로 사용할 수도 있다. 다만 시간이 많이 걸린다. 

***

이와 관련하여 다음과 같은 option들이 추가로 있다. ( 만약 ImageMagicK이 설치되어 있지 않다면 `sudo apt install imagemagick`으로 설치하자 )

* [`-threshold`](https://imagemagick.org/script/command-line-options.php#threshold)
* [`-black-threshold`](https://imagemagick.org/script/command-line-options.php#black-threshold) : force all pixels below the threshold into black
* [`-white-threshold`](https://imagemagick.org/script/command-line-options.php#white-threshold) : force all pixels above the threshold into white

다음과 같이 테스트 해 볼 수 있다. 

```bash
convert before.jpg -threshold 50% after_50.jpg
convert before.jpg -white-threshold 50% after_white_50.jpg
convert before.jpg -black-threshold 50% after_black_50.jpg
```


