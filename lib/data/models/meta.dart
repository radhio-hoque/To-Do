class Meta {
  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });
  late final int totalItems;
  late final int totalPages;
  late final int perPageItem;
  late final int currentPage;
  late final int pageSize;
  late final bool hasMorePage;

  Meta.fromJson(Map<String, dynamic> json){
    totalItems = json['total_items'];
    totalPages = json['total_pages'];
    perPageItem = json['per_page_item'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    hasMorePage = json['has_more_page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_items'] = totalItems;
    _data['total_pages'] = totalPages;
    _data['per_page_item'] = perPageItem;
    _data['current_page'] = currentPage;
    _data['page_size'] = pageSize;
    _data['has_more_page'] = hasMorePage;
    return _data;
  }
}