class NotificationModel {
  final String id;
  final String userId;
  final String receiverId;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Message message;

  NotificationModel({
    this.id = '',
    this.userId = '',
    this.receiverId = '',
    this.type = '',
    this.isRead = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    Message? message,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        message = message ?? Message();

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      type: json['type'] ?? '',
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      message: Message.fromJson(json['message'] ?? {}),
    );
  }
}

class Message {
  final String text;
  final String title;
  final List<String> photos;

  Message({
    this.text = '',
    this.title = '',
    List<String>? photos,
  }) : photos = photos ?? [];

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'] ?? '',
      title: json['title'] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    this.page = 1,
    this.limit = 10,
    this.total = 0,
    this.totalPage = 1,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}

class NotificationResponse {
  final List<NotificationModel> notification;
  final Meta meta;

  NotificationResponse({
    List<NotificationModel>? notification,
    Meta? meta,
  })  : notification = notification ?? [],
        meta = meta ?? Meta();

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      notification: (json['notification'] as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta'] ?? {}),
    );
  }
}