package com.jungram.pk.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jungram.pk.comment.domain.Comment;
import com.jungram.pk.comment.dto.CommentDetail;
import com.jungram.pk.comment.service.CommentService;
import com.jungram.pk.common.FileManager;
import com.jungram.pk.like.service.LikeService;
import com.jungram.pk.post.domain.Post;
import com.jungram.pk.post.dto.PostDetail;
import com.jungram.pk.post.repository.PostRepository;
import com.jungram.pk.user.domain.User;
import com.jungram.pk.user.service.UserService;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private UserService userService;

	@Autowired
	private LikeService likeService;

	@Autowired
	private CommentService commentService;

	public int addPost(int userId, String title, String content, String tag, MultipartFile file) {

		String imagePath = FileManager.saveFile(userId, file);

		return postRepository.insertPost(userId, title, content, tag, imagePath);
	}

	public List<PostDetail> getPostList(int userId) {

		List<Post> postList = postRepository.selectPostList();

		List<PostDetail> postDetailList = new ArrayList<>();
		for (Post post : postList) {

			User user = userService.getUser(post.getUserId());

			int likeCount = likeService.getCountByPostId(post.getId());

			List<CommentDetail> commentList = commentService.getCommentByPostId(post.getId());

			boolean isLike = likeService.isLike(post.getId(), userId);

			PostDetail postDetail = PostDetail.builder().id(post.getId()).content(post.getContent())
					.title(post.getTitle()).tag(post.getTag()).imagePath(post.getImagePath()).userId(post.getUserId())
					.loginId(user.getLoginId()).likeCount(likeCount).commentList(commentList).isLike(isLike).build();
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}

	public int deletePost(int postId, int userId) {

		Post post = postRepository.selectPost(postId);
		if (userId == post.getUserId()) {

			likeService.deleteLikeByPostId(postId);
			commentService.deleteCommentByPostId(postId);

			FileManager.removeFile(post.getImagePath());

			return postRepository.deletePost(postId);
		} else {
			return 0;
		}

	}
}
