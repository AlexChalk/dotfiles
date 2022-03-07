from beets.plugins import BeetsPlugin
from beets import config
import mediafile


class AlbumSortPlugin(BeetsPlugin):
    def __init__(self, *args, **kwargs):
        album_sort_field = mediafile.MediaField(
            mediafile.MP3StorageStyle(u"TSOA"),
            mediafile.MP4StorageStyle(u"soal"),
            mediafile.StorageStyle(u"Album Sort")
        )
        self.add_media_field("album_sort", album_sort_field)

        self.register_listener("write", self.write)

        super().__init__(*args, **kwargs)

    def write(self, item, path, tags):
        if tags['original_year'] == 0:
            tag_year = tags['year']
        else:
            tag_year = tags['original_year']

        if tags.get('comp', 0) == 1:
            tags["album_sort"] = f"99 {tag_year} {tags['album']}"
        else:
            tags["album_sort"] = f"{tag_year} {tags['album']}"
