# 이 MD File은 작업에 필요한 것들을 작성하는데 사용한다.

<!--- 2023-03-05 14:27:24 작성 --->

# DataPage design

- DataPage를 구현하기 위하여 필요한 것들
  > - 데이터를 입력 받기 위한 Widget / Text를 입력 받을 수 있게 한다. / 데이터에 따라 특정 값만 입력 가능하게 만들기
  > - 카테고리를 추가 시키기 위한 Widget / DropMenu로 구성되어 있다.
  >   > Category를 추가 시키기 위한 과정에서 Modal창을 사용하며, Category를 추가 삭제가 가능하도록 한다. <br>
  > - 취소와 확인 버튼.

---

# DataPage 기능 구현

---

# Categories Page

1. Categories를 ABDataController를 통해 Categories를 받아온다.
2. Stateful Widget이며, List\<String> Type으로 저장한다.
3. 추가, 삭제, 수정 버튼이 있다.

---

# Modal Widget

> Modal Widget은 Modal창을 띄우는 기능만을 수행한다. <br>
> 이러한 이유로 Modal은 Widget 또는 Page를 값으로 받아와 그것을 내부에 띄운다.

---

# graph

1. 그래프를 보여를 보여주며, 입력된 기간들에 대한 정보를 받는다.
2. 그 기간동안의 비용을 전부 계산하여 Total값을 문자열로 변경하여 보기 좋게 변경한다.

## graph의 종류들

1. 사용자가 선택한 기간과, 단위에 따른 그래프 // Bar Chart
2. 카테고리에 따라 사용 비율에 대한 그래프 // Pie Chart
3.

---

# 2023-03-05

적용해야 할 기술들과, 라이브러리들에 대하여 알아보기 직접 코드 만지는 것은 그 이후로 하여 추후 Code Refactoring을 최소화 시켜보자.

---
