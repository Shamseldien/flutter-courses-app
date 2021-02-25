// To parse this JSON data, do
//
//     final singleCourseModel = singleCourseModelFromJson(jsonString);

import 'dart:convert';

SingleCourseModel singleCourseModelFromJson(String str) => SingleCourseModel.fromJson(json.decode(str));

String singleCourseModelToJson(SingleCourseModel data) => json.encode(data.toJson());

class SingleCourseModel {
  SingleCourseModel({
    this.status,
    this.result,
  });

  String status;
  Result result;

  factory SingleCourseModel.fromJson(Map<String, dynamic> json) => SingleCourseModel(
    status: json["status"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.course,
    this.courseVideo,
    this.purchasedCourse,
    this.courseRating,
    this.totalRatings,
    this.isReviewed,
  //  this.lessons,
   // this.courseTimeline,
    this.completedLessons,
  //  this.continueCourse,
    this.isCertified,
    this.courseProcess,
  });

  Course course;
  dynamic courseVideo;
  bool purchasedCourse;
  int courseRating;
  int totalRatings;
  bool isReviewed;
 // List<ContinueCourse> lessons;
//  List<dynamic> courseTimeline;
  List<dynamic> completedLessons;
//  ContinueCourse continueCourse;
  bool isCertified;
  int courseProcess;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    course: Course.fromJson(json["course"]),
    courseVideo: json["course_video"],
    purchasedCourse: json["purchased_course"],
    courseRating: json["course_rating"],
    totalRatings: json["total_ratings"],
    isReviewed: json["is_reviewed"],
 //   lessons: List<ContinueCourse>.from(json["lessons"].map((x) => ContinueCourse.fromJson(x))),
 //   courseTimeline: List<CourseTimeline>.from(json["course_timeline"].map((x) => CourseTimeline.fromJson(x))),
    completedLessons: List<dynamic>.from(json["completed_lessons"].map((x) => x)),
  //  continueCourse: ContinueCourse.fromJson(json["continue_course"]),
    isCertified: json["is_certified"],
    courseProcess: json["course_process"],
  );

  Map<String, dynamic> toJson() => {
    "course": course.toJson(),
    "course_video": courseVideo,
    "purchased_course": purchasedCourse,
    "course_rating": courseRating,
    "total_ratings": totalRatings,
    "is_reviewed": isReviewed,
  //  "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
  //  "course_timeline": List<dynamic>.from(courseTimeline.map((x) => x.toJson())),
    "completed_lessons": List<dynamic>.from(completedLessons.map((x) => x)),
  //  "continue_course": continueCourse.toJson(),
    "is_certified": isCertified,
    "course_process": courseProcess,
  };
}

/*class ContinueCourse {
  ContinueCourse({
  //  this.id,
    //this.modelType,
    this.modelId,
    this.courseId,
    this.sequence,
    this.createdAt,
    this.updatedAt,
  });

  //int id;
  //String modelType;
  String modelId;
  String courseId;
  String sequence;
  DateTime createdAt;
  DateTime updatedAt;

  factory ContinueCourse.fromJson(Map<String, dynamic> json) => ContinueCourse(
  //  id: json["id"],
   // modelType: json["model_type"],
    modelId: json["model_id"],
    courseId: json["course_id"],
    sequence: json["sequence"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
   // "model_type": modelType,
    "model_id": modelId,
    "course_id": courseId,
    "sequence": sequence,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}*/

class Course {
  Course({
    this.id,
    this.categoryId,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.courseImage,
    this.startDate,
    this.featured,
    this.trending,
    this.popular,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.published,
    this.free,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image,
    this.teachers,
    this.category,
    this.publishedLessons,
    this.reviews,
   // this.courseTimeline,
    this.mediaVideo,
  });

  int id;
  String categoryId;
  String title;
  String slug;
  String description;
  String price;
  String courseImage;
  DateTime startDate;
  String featured;
  String trending;
  String popular;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  String published;
  String free;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String image;
  List<Teacher> teachers;
  Category category;
  List<PublishedLesson> publishedLessons;
  List<Review> reviews;
 // List<ContinueCourse> courseTimeline;
  dynamic mediaVideo;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    categoryId: json["category_id"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    price: json["price"],
    courseImage: json["course_image"],
    startDate: DateTime.parse(json["start_date"]),
    featured: json["featured"],
    trending: json["trending"],
    popular: json["popular"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    published: json["published"],
    free: json["free"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    image: json["image"],
    teachers: List<Teacher>.from(json["teachers"].map((x) => Teacher.fromJson(x))),
    category: Category.fromJson(json["category"]),
    publishedLessons: List<PublishedLesson>.from(json["published_lessons"].map((x) => PublishedLesson.fromJson(x))),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
   // courseTimeline: List<ContinueCourse>.from(json["course_timeline"].map((x) => ContinueCourse.fromJson(x))),
    mediaVideo: json["media_video"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "title": title,
    "slug": slug,
    "description": description,
    "price": price,
    "course_image": courseImage,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "featured": featured,
    "trending": trending,
    "popular": popular,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "published": published,
    "free": free,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "image": image,
    "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
    "category": category.toJson(),
    "published_lessons": List<dynamic>.from(publishedLessons.map((x) => x.toJson())),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  //  "course_timeline": List<dynamic>.from(courseTimeline.map((x) => x.toJson())),
    "media_video": mediaVideo,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String slug;
  String icon;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class PublishedLesson {
  PublishedLesson({
    this.id,
    this.courseId,
    this.title,
    this.slug,
    this.lessonImage,
    this.shortText,
    this.fullText,
    this.position,
    this.freeLesson,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image,
    this.lessonReadtime,
  });

  int id;
  String courseId;
  String title;
  String slug;
  dynamic lessonImage;
  String shortText;
  dynamic fullText;
  String position;
  String freeLesson;
  String published;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic image;
  int lessonReadtime;

  factory PublishedLesson.fromJson(Map<String, dynamic> json) => PublishedLesson(
    id: json["id"],
    courseId: json["course_id"],
    title: json["title"],
    slug: json["slug"],
    lessonImage: json["lesson_image"],
    shortText: json["short_text"],
    fullText: json["full_text"],
    position: json["position"],
    freeLesson: json["free_lesson"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    image: json["image"],
    lessonReadtime: json["lesson_readtime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "title": title,
    "slug": slug,
    "lesson_image": lessonImage,
    "short_text": shortText,
    "full_text": fullText,
    "position": position,
    "free_lesson": freeLesson,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "image": image,
    "lesson_readtime": lessonReadtime,
  };
}

class Review {
  Review({
    this.id,
    this.userId,
    this.reviewableId,
    this.reviewableType,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String reviewableId;
  String reviewableType;
  String rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["user_id"],
    reviewableId: json["reviewable_id"],
    reviewableType: json["reviewable_type"],
    rating: json["rating"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "reviewable_id": reviewableId,
    "reviewable_type": reviewableType,
    "rating": rating,
    "content": content,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Teacher {
  Teacher({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.phone,
    this.gender,
    this.address,
    this.city,
    this.pincode,
    this.state,
    this.country,
    this.avatarType,
    this.avatarLocation,
    this.passwordChangedAt,
    this.active,
    this.confirmationCode,
    this.confirmed,
    this.timezone,
    this.lastLoginAt,
    this.lastLoginIp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fullName,
    this.image,
    this.pivot,
  });

  int id;
  String uuid;
  String firstName;
  String lastName;
  String email;
  dynamic dob;
  dynamic phone;
  String gender;
  dynamic address;
  dynamic city;
  dynamic pincode;
  dynamic state;
  dynamic country;
  String avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  bool active;
  String confirmationCode;
  bool confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fullName;
  String image;
  Pivot pivot;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    uuid: json["uuid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    dob: json["dob"],
    phone: json["phone"],
    gender: json["gender"],
    address: json["address"],
    city: json["city"],
    pincode: json["pincode"],
    state: json["state"],
    country: json["country"],
    avatarType: json["avatar_type"],
    avatarLocation: json["avatar_location"],
    passwordChangedAt: json["password_changed_at"],
    active: json["active"],
    confirmationCode: json["confirmation_code"],
    confirmed: json["confirmed"],
    timezone: json["timezone"],
    lastLoginAt: json["last_login_at"],
    lastLoginIp: json["last_login_ip"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    fullName: json["full_name"],
    image: json["image"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "dob": dob,
    "phone": phone,
    "gender": gender,
    "address": address,
    "city": city,
    "pincode": pincode,
    "state": state,
    "country": country,
    "avatar_type": avatarType,
    "avatar_location": avatarLocation,
    "password_changed_at": passwordChangedAt,
    "active": active,
    "confirmation_code": confirmationCode,
    "confirmed": confirmed,
    "timezone": timezone,
    "last_login_at": lastLoginAt,
    "last_login_ip": lastLoginIp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "full_name": fullName,
    "image": image,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.courseId,
    this.userId,
  });

  String courseId;
  String userId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    courseId: json["course_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "user_id": userId,
  };
}

class CourseTimeline {
  CourseTimeline({
    this.title,
    this.type,
    this.id,
    this.description,
    this.completed,
  });

  String title;
  String type;
  String id;
  String description;
  bool completed;

  factory CourseTimeline.fromJson(Map<String, dynamic> json) => CourseTimeline(
    title: json["title"],
    type: json["type"],
    id: json["id"],
    description: json["description"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type,
    "id": id,
    "description": description,
    "completed": completed,
  };
}
