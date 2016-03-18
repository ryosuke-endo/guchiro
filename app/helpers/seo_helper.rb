module SeoHelper
  def default_meta_tags
    {
      site: t('meta_site_title'),
      description: t('meta_descrption'),
      page_keywords: t('meta_keywords')
    }
  end
end
