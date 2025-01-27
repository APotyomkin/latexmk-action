# MIT License
#
# Copyright (c) 2021 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM yegor256/rultor-image:1.7.1

LABEL "repository"="https://github.com/yegor256/latexmk-action"
LABEL "maintainer"="Yegor Bugayenko"

RUN gem install texsc:0.6.0
RUN gem install texqc:0.6.0
RUN apt install -y aspell

RUN tlmgr option repository ctan
RUN tlmgr --verify-repo=none update --self
RUN tlmgr --verify-repo=none install latexmk
RUN tlmgr --verify-repo=none install biber

RUN apt install -y python3-pygments
RUN pip3 install pygments

WORKDIR /home
COPY entry.sh /home

ENTRYPOINT ["/home/entry.sh"]
