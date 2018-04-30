class HomeController < ApplicationController
  def index
    @posts = Post.all # 얘는 Post라는 표 전체를 담고 있어
  end

  def new
  end

  def create  # action
    # 첫 번째 post를 만들고 저장하는 과정

    @post = Post.new  # <- 얘는 무조건 대문자. class임.
                      # data로 장난치는 건 대문자
    # post 모델에 새로운 개체를 넣을 공간인 row를 추가하고, 그 공간을 @post라고 하자.
    # 새로운 칸을 만들라는 의미 
    # @는 변수를 의미한다. (어떤 값을 지정하고 넣을 수 있는 상자같은 의미.)
    # view 파일에서 <%= @Post.title %> 이라고 쓸 수 있게 됨.
    @post.title = params[:title]
    # '.' 은 접근의 의미. title 나와라 ! 
    # params로 날아온 title의 내용을 새로 만든 이 공간 @post의 title 란에 넣어 (user가 작성한 내용)
    @post.content = params[:content]
    # cf. content는 두 번째로 받은 key의 이름
    # params로 날아온 content의 내용을 새로 만든 이 공간 @post의 content 란에 넣어버려 (user가 작성한 내용)
    @post.save
    # 지금 위에서 table에 써준 내용 모두 저장해 !
    # migrate와 비슷함. 저장하라는 명령어. (번호가 부여됨)

    redirect_to '/'  # index 페이지로 이동
    # 이제 다시 '/'로 돌아가
  end
# Controller가 Model에도 접근할 수 있도록 ! 
# DB가 이걸 보고 찾을 수 있음. (요청한 게 있니?)


  def show
    @post = Post.find(params[:post_id])
  end 
  # @post란 : x 번째 게시물을 찾아줘 ! 타이틀을 찾아줘 ! 내용을 보여줘 ! 
  # (해당글.title을 key에서 역으로 얻어내는 것. 
  #   cf. 원래 Post.find(해당글)에서 찾았다면, params[:post_id]를 통해 역으로 해당 글의 위치를 찾는다.
  #   @post = Post.find(params[:post_id]) )

  def edit
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    # view 파일이 없음! 어디로 가야해?
    redirect_to '/'  # index 페이지로 가자 (root 페이지)
    # save와 비슷하게 우리가 만드는 것이 아니라 원래 존재하는 명령어다. 
  end

  def update  # cf. create
    @post = Post.find(params[:post_id])  # 여기가 create와 다른 점! 새로 만드는 것이 아니라 있는 걸 찾아오는 것. 
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    redirect_to '/'  
  end

end

